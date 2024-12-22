resource "aws_instance" "web" {
  count                       = length(var.ec2_names)
  ami                         = data.aws_ami.amazon-2.id
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [var.sg_id]
  associate_public_ip_address = true
  subnet_id                   = var.subnets[count.index]
  availability_zone           = data.aws_availability_zones.available.names[count.index]
  user_data                   = <<EOF
    #!/bin/bash
    # Update the package list and install Apache
    yum update -y
    yum install -y httpd
    
    # Start Apache service and enable it to start on boot
    systemctl start httpd
    systemctl enable httpd

    # Create a simple webpage
    echo "<h1>Welcome to my EC2 instance!</h1>" > /var/www/html/index.htm

    EOF


  tags = {
    Name = var.ec2_names[count.index]
  }

}
