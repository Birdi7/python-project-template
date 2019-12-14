for i in "$@"; do
    case $i in
    -n=* | --name=*)
        DIR_NAME="${i#*=}"
        ;;
    esac
done

git clone --progress git@github.com:Birdi7/python-project-template.git ${DIR_NAME}
