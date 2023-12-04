function g --wraps=./gradlew --description 'alias g=./gradlew'
  ./gradlew --console=rich $argv &| grcat gradle; 
end
