dynamodb = [
{
  db_name = "helloworld"
  billing_mode = "PROVISIONED"
  read_capacity = 3
  write_capacity = 3
  hash_key = "hello"
  range_key = "world"
  dynamodb_attributes = [
    {
      name = "hello"
      type = "S"
    },
    {
      name = "world"
      type = "N"
     },
  ]
  tags = "helloworld"
  ttl_enabled = false
  global_secondary_index = []
  local_secondary_index = []
},

{
  db_name = "helloworld2"
  billing_mode = "PROVISIONED"
  read_capacity = 1
  write_capacity = 1
  hash_key = "hello1"
  range_key = "world1"
  dynamodb_attributes = [
    {
      name = "hello1"
      type = "S"
    },
    {
      name = "world1"
      type = "S"
     },
     {
       name = "world2"
       type = "S"
      },
  ]
  tags = "helloworld2"
  ttl_enabled = true
  global_secondary_index = [
    {
      name = "hello2"
      hash_key = "world1"
      range_key = "world2"
      write_capacity = 1
      read_capacity = 1
      projection_type = "INCLUDE"
      non_key_attributes = ["hello1"]
    },
  ]
  local_secondary_index = []
},
{
  db_name = "helloworld3"
  billing_mode = "PROVISIONED"
  read_capacity = 1
  write_capacity = 1
  hash_key = "hello"
  range_key = "world"
  dynamodb_attributes = [
    {
      name = "hello"
      type = "S"
    },
    {
      name = "world"
      type = "S"
     },
  ]
  tags = "helloworld"
  ttl_enabled = false
  global_secondary_index = []
  local_secondary_index = [
    {
      name = "hello_world3"
      range_key = "world"
      projection_type = "INCLUDE"
      non_key_attributes = ["hello", "world"]
    }
  ]
},

{
  db_name = "helloworld5"
  billing_mode = "PROVISIONED"
  read_capacity = 1
  write_capacity = 1
  hash_key = "hello"
  range_key = "world"
  dynamodb_attributes = [
    {
      name = "hello"
      type = "N"
    },
    {
      name = "world"
      type = "B"
     },
  ]
  tags = "helloworld"
  ttl_enabled = false
  global_secondary_index = []
  local_secondary_index = []
},
]
