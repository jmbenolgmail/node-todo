#!/bin/bash

HOST="10.7.4.2"
PORT="8080"

function Help() {
        echo -e "Usage:"
        echo -e "GET TODOS:   $0 -g [table|txt|json]"
        echo -e "ADD TODO:    $0 -a description"
        echo -e "DELETE TODO: $0 -d id"
        echo -e "TEST APP:    $0 -t"
}

# returns all todos
function get_todos_raw() {
	local todos=$(curl -s -X GET http://$HOST:$PORT/api/todos)
	echo "$todos"
}

# return all todos in json format
function get_todos_json() {
	local todos_json=$(get_todos_raw | jq '.')
	echo "$todos_json"
}

# return all todos in txt format
function get_todos_txt() {
	local todos_txt=$(get_todos_raw | jq -r '["ID","TEXT"],(.[] | [._id, .text]) | @csv')
        echo "$todos_txt"
}

# return all todos in table format
function get_todos_table() {
	local todos_table=$(get_todos_raw | jq -r '["ID","TEXT"],(.[] | [._id, .text]) | @csv' | csvlook)
        echo "$todos_table"
}


# create a single todo
# INPUT: todo text description
function add_single_todo() {
	curl -X POST -s -o /dev/null "http://$HOST:$PORT/api/todos" -H 'Content-Type: application/json' -d "{ \"text\":\"$1\" }"
}

# delete a single todo
# INPUT: todo id
function delete_single_todo() {
	curl -X DELETE -s -o /dev/null "http://$HOST:$PORT/api/todos/$1"
}

# Test node todo
# Creates random numer of todos, lists todos in different formats, deletes all todos
function test_node_todo() {
	number=$(( $RANDOM % 91 + 10 ))
	for ((i=1; i <= number; i++)); do
		add_single_todo "test $i"
	done

	echo -e "\n\n============================="
	echo -e "todos in json format"
	echo -e "============================="
	get_todos_json

        echo -e "\n\n============================="
        echo -e "todos in txt format"
        echo -e "============================="
	get_todos_txt

        echo -e "\n\n============================="
        echo -e "todos in table format"
        echo -e "============================="
	get_todos_table

	for id in $(curl -s  http://$HOST:$PORT/api/todos | jq -r '.[] | ._id'); do
		delete_single_todo "$id"
	done
}

case "$1" in
  -g | --get)
	  case "$2" in
		  txt)
			  get_todos_txt
			  ;;
		  table)
			  get_todos_table
			  ;;
		  json)
			  get_todos_json
			  ;;
		  *)
			  Help
			  ;;
	  esac 
    ;;
  -a | --add)
	  if [[ -z "$2" ]]; then
		  Help
	  else
		  add_single_todo "$2"
	  fi
    ;;
  -d | --delete)
	  if [[ -z "$2" ]]; then
                  Help
          else
		  delete_single_todo "$2"
          fi
    ;;
  -t | --test)
          test_node_todo
    ;;
  *)
	  Help
    ;;
esac
