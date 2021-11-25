resource "aws_instance" "instance" {
    ami = var.ami
    instance_type = "t2.micro"
    key_name= "aws_key"
    vpc_security_group_ids=[aws_security_group.main.id] 

  provisioner "remote-exec" {
    inline = ["sudo apt-get update","sudo apt install python -y",
    "sudo apt install python3 -y","sudo apt-get install ansible -y","sudo apt-get update -y",
    "sudo apt-get update -y","sudo apt-get install openjdk-11-jdk -y",
    "sudo apt install python-apt -y","sudo apt-get update -y",]
  on_failure = "continue"
  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("/home/ec2-user/environment/Karthik_Terraform/aws_key")
      timeout     = "4m"
      }
      
  }
provisioner "local-exec" {
        command = "sudo ANSIBLE_HOST_KEY_CHECKING=False sudo ansible-playbook -u ubuntu --private-key ./aws_key -i '${aws_instance.instance.public_ip},' master.yml" 
        
        
        
    
        
        
    }
    
lifecycle {
   prevent_destroy = false
    }
}



resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "use your public key"
}