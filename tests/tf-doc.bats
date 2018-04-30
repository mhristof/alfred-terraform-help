export ALFRED_CACHE=/tmp/$RANDOM

mkdir -p $ALFRED_CACHE
CMD="./tf-doc.py --providers=vault"

@test "generates valid help message" {
    ./tf-doc.py --help
}

@test "generates valid json output" {
    $CMD
}

@test "cache folder is created" {
    $CMD
}

@test "generate urls" {
    $CMD | jq '.items[].arg' | grep 'https://www.terraform.io/docs/providers/vault/index.html'
}

@test "clearing the caches" {
    $CMD
    $CMD --clear-cache | grep $ALFRED_CACHE
}

@test "check pep8" {
    pycodestyle tf-doc.py
}

@test "requirements.txt" {
    docker run -v $PWD:/work python:3.6 bash -c 'pip install -r /work/requirements.txt'
}

rm -rf $ALFRED_CACHE
