class AddTestData < ActiveRecord::Migration
  def self.up
    Course.delete_all
    Course.create(:title => 'Rinnakkaisohjelmointi',
      :description => 
      %{<p>
          Kurssin tavoitteena on ymmärtää rinnakkaisten ja hajautettujen
          järjestelmien ohjelmoinnin peruskäsitteet, tuntea keskeinen
          ongelmanasettelu sekä osata soveltaa tavallisimpia ratkaisumenetelmiä. 
        </p>})
    Course.create(:title => 'Versionhallinta',
      :description => 
      %{<p>
          Kurssilla tutustutaan versionhallinnan käyttöön työkaluna 
          ja eri kurssien tukena. Esimerkkinä käydään läpi lähdekoodin 
          hallinnan eri tilanteet, mutta myös käyttö apuvälineenä 
          esimerkiksi tieteellisen kirjoittamisen kurssille. Tutustutaan 
          keskitetyn ja hajautetun mallin ratkaisuihin.
        </p>})
    Course.create(:title => 'Laskennan Mallit',
      :description => 
      %{<p>
          Kurssilla luodaan peruskatsaus laskennallisten
          ongelmien ja niiden ratkaisemiseksi käytettävien
          laskentamekanismien matemaattisiin malleihin.
          Perustavoitteena on nähdä, miten näistä asioista
          voidaan esittää täsmällisiä määritelmiä ja päätelmiä. 
          Samalla tutustutaan tietojenkäsittelyteorian perustuloksiin 
          ja niiden vaikutuksiin tietojenkäsittelytieteen eri osa-alueilla.
        </p>
        <p>
          Kurssilla käsitellään ensin säännöllisiä ja kontekstittomia 
          kieliä ja niiden tunnistamiseen kykeneviä automaatteja, 
          joilla on sovelluksia esim. ohjelmointikielissä. Lopuksi 
          tarkastellaan kysymystä siitä, mitkä ongelmat on ylipäänsä 
          mahdollista ratkaista algoritmisesti. Tässä käytetään Turingin 
          konetta formalisoimaan, mitä "algoritmilla" oikeastaan tarkoitetaan. 
        </p>})
    Course.create(:title => 'Agile Web Development and Ruby on Rails',
      :description => 
      %{<p>
          Kurssilla perehdytään Ruby ohjelmointikieleen, 
          Ruby on Rails ohjelmistokehykseen ja MVC-arkkitehtuuriin. 
          Kurssiin liittyy kurssin aikana tehtävä pieni harjoitustyö, 
          jonka etenemistä seurataan harjoituksissa. Esitiedot: 
          Tietokantasovellus. Huom: Kurssin harjoitukset alkavat 
          jo ensimmäisellä luentoviikolla. Kurssi perustuu kurssikirjaan: 
          Agile Web Development with Rails, Pragmatic Bookshelf, Third Edition, 2009 (Sam Ruby, Dave Thomas, and David Hansson)
        </p>})
  end

  def self.down
    Course.delete_all
  end
end
