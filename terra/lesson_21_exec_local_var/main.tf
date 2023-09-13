provider "aws" {
  region = "eu-west-2"
}

resource "null_resource" "command1" {
  provisioner "local-exec" {
    command = "echo Terrafrom START: $(date) >> log.txt"

  }

}

resource "null_resource" "command2" {
  provisioner "local-exec" {
    command = "ping -c 5 www.ya.ru"

  }
}

resource "null_resource" "command3" {
  provisioner "local-exec" {
    command     = "print('Hello Aman')"
    interpreter = ["python3", "-c"]
  }
}

resource "null_resource" "command4" {
  provisioner "local-exec" {
    command = "echo $NAME1 $NAME2 $NAME3 >> names.txt "
    environment = {
      NAME1 = "Zahar"
      NAME2 = "Aman"
      NAME3 = "Mira"

    }

  }

}




resource "null_resource" "command5" {
  provisioner "local-exec" {
    command = "echo Terrafrom END: $(date) >> log.txt"

  }

}