generate_random_name() {
  hash=$(openssl rand -hex 4)
  ext=$(echo "$1" | awk -F . '{print $NF}')
  echo "${hash}.${ext}"
}

