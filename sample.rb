# Constantes pour les choix de menu
CHOIX_SAISIE = 1
CHOIX_CONSULTATION = 2
CHOIX_QUITTER = 3

# Boucle principale du programme
loop do
  puts "Sélectionnez le processus que vous souhaitez mettre en œuvre"
  puts "#{CHOIX_SAISIE}: Saisir les points d'évaluation et les commentaires"
  puts "#{CHOIX_CONSULTATION}: Consultez les résultats obtenus jusqu'à présent."
  puts "#{CHOIX_QUITTER}: Quitter"
  
  num = gets.to_i

  case num
  when CHOIX_SAISIE
    puts "Veuillez donner une note de 1 à 5"
    point = gets.to_i
    
    # Boucle jusqu'à ce que l'utilisateur donne une note valide
    until point.between?(1, 5)
      puts "Veuillez indiquer sur une échelle de 1 à 5"
      point = gets.to_i
    end
    
    puts "Merci de saisir un commentaire"
    comment = gets.chomp
    post = "Point : #{point} Commentaire : #{comment}"
    
    # Écrire les données dans un fichier
    File.open("data.txt", "a") do |file|
      file.puts(post)
    end
  when CHOIX_CONSULTATION
    puts "Résultats obtenus jusqu'à présent."
    
    # Lire les données depuis le fichier
    File.open("data.txt", "r") do |file|
      file.each_line do |line|
        puts line
      end
    end
  when CHOIX_QUITTER
    puts "Finir"
    break
  else
    puts "Veuillez saisir de 1 à 3"
  end
end
