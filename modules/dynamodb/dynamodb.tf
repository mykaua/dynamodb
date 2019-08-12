resource "aws_dynamodb_table" "basic-dynamodb-table" {
  count = "${length(var.dynamodb)}"
  name           = "${var.dynamodb[count.index].db_name}"
  billing_mode   = "${var.dynamodb[count.index].billing_mode}"
  read_capacity  = "${var.dynamodb[count.index].read_capacity}"
  write_capacity = "${var.dynamodb[count.index].write_capacity}"
  hash_key       = "${var.dynamodb[count.index].hash_key}"
  range_key      = "${var.dynamodb[count.index].range_key}"

  dynamic "attribute" {
    for_each = "${var.dynamodb[count.index].dynamodb_attributes}"
    content {
    name = attribute.value["name"]
    type = attribute.value["type"]
    }
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = "${var.dynamodb[count.index].ttl_enabled}"
  }

  dynamic "global_secondary_index" {
    for_each = "${var.dynamodb[count.index].global_secondary_index}"
    content {
    name = global_secondary_index.value["name"]
    hash_key = global_secondary_index.value["hash_key"]
    range_key = global_secondary_index.value["range_key"]
    write_capacity = global_secondary_index.value["write_capacity"]
    read_capacity = global_secondary_index.value["read_capacity"]
    projection_type = global_secondary_index.value["projection_type"]
    non_key_attributes = global_secondary_index.value["non_key_attributes"]
    }
  }

  dynamic "local_secondary_index" {
    for_each = "${var.dynamodb[count.index].local_secondary_index}"
    content {
    name = local_secondary_index.value["name"]
    range_key = local_secondary_index.value["range_key"]
    projection_type = local_secondary_index.value["projection_type"]
    non_key_attributes = local_secondary_index.value["non_key_attributes"]
    }
  }


  tags = {
    Name        = "${var.dynamodb[count.index].tags}"
  }
}
