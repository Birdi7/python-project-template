for i in "$@"; do
    case $i in
    -n=* | --name=*)
        DIR_NAME="${i#*=}"
        ;;
    esac
done

git clone --progress git@github.com:Birdi7/python-project-template.git ${DIR_NAME} &&
    cd ${DIR_NAME} &&
    rm -rf .git && 
    poetry install &&
    poetry run pre-commit install
