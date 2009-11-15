class AddTestData < ActiveRecord::Migration
  def self.up
    Course.delete_all
    Course.create(:title => 'Rinnakkaisohjelmointi',
      :description => 
      %{ Kurssin tavoitteena on ymmärtää rinnakkaisten ja hajautettujen
         järjestelmien ohjelmoinnin peruskäsitteet, tuntea keskeinen
         ongelmanasettelu sekä osata soveltaa tavallisimpia ratkaisumenetelmiä.})
    Course.create(:title => 'Versionhallinta',
      :description => 
      %{
          Kurssilla tutustutaan versionhallinnan käyttöön työkaluna 
          ja eri kurssien tukena. Esimerkkinä käydään läpi lähdekoodin 
          hallinnan eri tilanteet, mutta myös käyttö apuvälineenä 
          esimerkiksi tieteellisen kirjoittamisen kurssille. Tutustutaan 
          keskitetyn ja hajautetun mallin ratkaisuihin.
        })
    Course.create(:title => 'Laskennan Mallit',
      :description => 
      %{
          Kurssilla luodaan peruskatsaus laskennallisten
          ongelmien ja niiden ratkaisemiseksi käytettävien
          laskentamekanismien matemaattisiin malleihin.
          Perustavoitteena on nähdä, miten näistä asioista
          voidaan esittää täsmällisiä määritelmiä ja päätelmiä. 
          Samalla tutustutaan tietojenkäsittelyteorian perustuloksiin 
          ja niiden vaikutuksiin tietojenkäsittelytieteen eri osa-alueilla.
        
          Kurssilla käsitellään ensin säännöllisiä ja kontekstittomia 
          kieliä ja niiden tunnistamiseen kykeneviä automaatteja, 
          joilla on sovelluksia esim. ohjelmointikielissä. Lopuksi 
          tarkastellaan kysymystä siitä, mitkä ongelmat on ylipäänsä 
          mahdollista ratkaista algoritmisesti. Tässä käytetään Turingin 
          konetta formalisoimaan, mitä "algoritmilla" oikeastaan tarkoitetaan. 
        })
    Course.create(:title => 'Agile Web Development and Ruby on Rails',
      :description => 
      %{
          Kurssilla perehdytään Ruby ohjelmointikieleen, 
          Ruby on Rails ohjelmistokehykseen ja MVC-arkkitehtuuriin. 
          Kurssiin liittyy kurssin aikana tehtävä pieni harjoitustyö, 
          jonka etenemistä seurataan harjoituksissa. Esitiedot: 
          Tietokantasovellus. Huom: Kurssin harjoitukset alkavat 
          jo ensimmäisellä luentoviikolla. Kurssi perustuu kurssikirjaan: 
          Agile Web Development with Rails, Pragmatic Bookshelf, Third Edition, 2009 (Sam Ruby, Dave Thomas, and David Hansson)
        })
    Course.create(:title => 'TDD programming technique and designing code',
      :description => 
      %{
          Kurssilla opetellaan kirjoittamaan ohjelmia Test-Driven Development 
          -suunnittelumenetelmää käyttäen. Keskeisessä asemassa on oppia 
          kirjoittamaan koodista hyvää ja ylläpidettävää, niin että sitä on 
          helppo lukea ja muokata. Käytännön harjoittelu on tärkeässä osassa 
          ja oppilaat ohjelmoivat kurssin aikana pari harjoitustyötä. TDD:n 
          lisäksi käsitellään myös muita ketteriä toteutustason menetelmiä.
        })
    Course.create(:title => 'Ohjelmoinnin perusteet',
      :description =>
      %{
        Kurssi on tietojenkäsittelytieteen perusopintojen pakollinen kurssi. 
        Sen laajuus on 5 opintopistettä. Kurssilla perehdytään ohjelmoinnin 
        keskeisiin periaatteisiin ja ajattelutapoihin. Sisältöä ovat mm. 
        tietokone ja ohjelma, algoritmi ja sen tila, Java, sijoitus ja 
        lausekkeet, tulostus ja syöttö, ehdollisuus, metodit ja niiden 
        parametrit, luokat ja oliot abstraktin tietotyypin toteuttamisessa, 
        taulukot. Opiskelijalta ei edellytetä ennakkotietoja ohjelmoinnista. 
        Ohjelmointikielenä on Java. Normaalisti opiskelija suorittaa tämän 
        kurssin jälkeen välittömästi Ohjelmoinnin jatkokurssin, 4 op. 
      })
  end

  def self.down
    Course.delete_all
  end
end
