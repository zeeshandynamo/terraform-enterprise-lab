####################################
# IAM Role for Jenkins
####################################

resource "aws_iam_role" "jenkins_role" {

  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}

####################################
# IAM Role for Bastion
####################################

resource "aws_iam_role" "bastion_role" {

  name = var.bastion_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}

####################################
# IAM Instance Profile for Bastion
####################################

resource "aws_iam_instance_profile" "bastion_profile" {

  name = var.bastion_instance_profile_name

  role = aws_iam_role.bastion_role.name
}

####################################
# Administrator Policy
####################################

resource "aws_iam_role_policy_attachment" "bastion_admin" {

  role = aws_iam_role.bastion_role.name

  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

####################################
# IAM Instance Profile
####################################

resource "aws_iam_instance_profile" "jenkins_profile" {

  name = var.instance_profile_name

  role = aws_iam_role.jenkins_role.name
}

####################################
# IAM Policy for Terraform
####################################

resource "aws_iam_role_policy_attachment" "terraform_admin" {

  role = aws_iam_role.jenkins_role.name

  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
