require "csv"
require "open-uri"

filepath = "db/objects.csv"

Legend.destroy_all
User.destroy_all
Reservation.destroy_all

user = User.new(first_name: "admin", last_name: "admin", email: "admin@site.com", password: "000000")
user.save!
user = User.new(first_name: "cleo", last_name: "patre", email: "cleopatre@site.com", password: "000000")
user.save!
user = User.new(first_name: "donald", last_name: "duck", email: "donaldduck@site.com", password: "000000")
user.save!
user = User.new(first_name: "xi", last_name: "hua", email: "xihua@site.com", password: "000000")
user.save!

objects = []

CSV.foreach(filepath, headers: :first_row) do |row|
  legend = Legend.new(name: row['name'], category: row['category'], description: row['description'], price: row['price'], user: User.all.sample)
  if legend.save
    begin
      file1 = URI.open(row['url1']) if row['url1'].present?
      file2 = URI.open(row['url2']) if row['url2'].present?

      legend.photos.attach(io: file1, filename: File.basename(row['url1']), content_type: "image/png") if file1.present?
      # legend.photos.attach(io: file2, filename: File.basename(row['url2']), content_type: "image/png") if file2.present?
    rescue OpenURI::HTTPError => e
      puts "Failed to open URL: #{e.message}"
    end
  else
    puts "Failed to save legend: #{legend.errors.full_messages.join(', ')}"
  end
end

# Legend.destroy_all

# legends = Legend.create([

# {name: 'Trident de Poséidon', category: 'Armes', description: 'Maîtrisez les mers et commandez les tempêtes avec le Trident de Poséidon. Parfait pour impressionner vos amis lors de vos sorties à la plage ou de vos soirées à thème mythologique.', price: '150 €'},
# {name: 'Bâton du Sun Wukong', category: 'Armes', description: 'Devenez le Roi Singe avec ce bâton magique capable de changer de taille à volonté. Idéal pour atteindre les fruits les plus hauts ou pour repousser les ennemis lors de vos aventures.', price: '120 €'},
# {name: 'Marteau de Thor', category: 'Armes', description: 'Invoquez la puissance du tonnerre avec Mjöllnir, le marteau légendaire de Thor. Seulement pour ceux jugés dignes ! Attention : risques de destruction massive.', price: '200 €'},
# {name: 'La hache de Pangu', category: 'Armes', description: 'Recréez la création du monde avec cette hache mythique. Parfaite pour des travaux de démolition ou pour faire une forte impression lors de votre prochaine fête costumée.', price: '100 €'},
# {name: 'Cape invisibilité Harry Potter', category: 'Vêtements-Chaussures', description: 'Disparaissez en un clin d'œil avec cette cape magique. Idéale pour les escapades secrètes et les tours de magie. Ne fonctionne pas sur les caméras de sécurité.', price: '250 €'},
# {name: 'Le chapeau de Spirou', category: 'Vêtements-Chaussures', description: '', price: '30 €'},
# {name: 'Les bottes Hermès', category: 'Vêtements-Chaussures', description: '', price: '20 €'},
# {name: 'Les bottes de sept lieues', category: 'Vêtements-Chaussures', description: '', price: '160 €'},
# {name: 'Anneau de Sauron', category: 'Bijoux & accessoires', description: '', price: '300 €'},
# {name: 'Les cailloux du petit poucet', category: 'Bijoux & accessoires', description: '', price: '10 €'},
# {name: 'Le menhir Obélix', category: 'Bijoux & accessoires', description: '', price: '80 €'},
# {name: 'Collier de Shiva', category: 'Bijoux & accessoires', description: '', price: '220 €'},
# {name: 'T.a.r.d.i.s. de Docteur Who', category: 'Moyen de transport', description: '', price: '500 €'},
# {name: 'Traineau du Père Noël', category: 'Moyen de transport', description: '', price: '350 €'},
# {name: 'Kitt la voiture de K2000', category: 'Moyen de transport', description: '', price: '400 €'},
# {name: 'Le skateboard de Bart Simpson', category: 'Moyen de transport', description: '', price: '20 €'}


# legends = Legend.create([

# {first_name: 'Brice', last_name: 'Ran', email: 'b.ran@juk.com', password: '#####'},
# {first_name: 'Sylvia', last_name: 'Roof', email: 'sylv.r@juk.com', password: '#####'},
# {first_name: 'Illia', last_name: 'Arli', email: 'illia.arli@juk.com', password: '#####'}
