data "template_file" "file_import" {
  template = "${file("opendj.tpl")}"

  vars {
    rootUserPassword     = "${random_string.rootUserPassword.result}"
    monitorUserPassword  = "${random_string.monitorUserPassword.result}"
    tag_name             = "${var.dj_dns}"
  }
}

data "template_cloudinit_config" "render_parts" {
  gzip          = true
  base64_encode = true

  part {
    filename     = "user_data.sh"
    content_type = "text/x-shellscript"
    content      = "${data.template_file.file_import.rendered}"
  }
}

data "aws_security_group" "desired" {
  id = "${var.sg_id}"
}

data "aws_subnet" "selected" {
  id = "${var.subnet_id}"
}

resource "aws_instance" "dj" {
  ami                    = "${lookup(var.instance_ami_map, var.region)}"
  instance_type          = "${var.dj_instance_size}"
  vpc_security_group_ids = ["${data.aws_security_group.desired.id}"]
  source_dest_check      = false
  subnet_id              = "${data.aws_subnet.selected.id}"
  key_name               = "${aws_key_pair.generated_key.key_name}"
  iam_instance_profile   = "${var.iam_role}"
  user_data              = "${data.template_cloudinit_config.render_parts.rendered}"
  
  root_block_device {
    volume_type = "gp2"
  }

  tags = "${merge(var.tags,
    map("Name", "${var.dj_dns}")
  )}"
}

resource "null_resource" "connect_instance" {
 depends_on       = ["aws_instance.dj"]
 connection {
   host        = "${aws_instance.dj.public_ip}"
   user        = "ec2-user"
   private_key = "${file(var.private_key)}"
 }

 provisioner "remote-exec" {
   inline = [
     "sleep 180",
     "sudo /opt/opendj/bin/status --offline"
   ]
   }
}