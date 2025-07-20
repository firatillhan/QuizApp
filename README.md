Angela Yu’nun Udemy üzerindeki iOS eğitiminde yer alan ve MVC mimarisi ile yapılan QuizApp projesini temel alarak, uygulamaya aşağıdaki özellikleri ekledim:
* Kullanıcı 20 soruyu tamamladığında, ekrana bir uyarı penceresi (UIAlert) çıkar:
    * “Quiz bitti” mesajı görüntülenir.
    * Kullanıcının doğru sayısı gösterilir.
    * "Tekrar başlamak ister misiniz?" şeklinde bir seçenek sunulur.
* Kullanıcı “Evet” cevabını verirse:
    * Test sıfırlanır.
    * Sorular baştan gösterilmeye başlanır.
    * Doğru ve yanlış seçeneklerini temsil eden butonlar tekrar aktif hale gelir.
* Kullanıcı “Hayır” cevabını verirse:
    * Doğru ve yanlış butonları pasif (enabled = false) hale getirilir.
    * Soru label'ı temizlenerek boş bir görünüme geçilir.
    * Ekranın tam ortasında yer alan "Tekrar Oyna" butonu görünür (isHidden = false) hale gelir.
* "Tekrar Oyna" butonuna tıklanması durumunda:
    * Uygulama yeniden başlatılır.
    * Sorular sıfırdan başlayarak tekrar gösterilmeye başlanır.
    * Tüm butonlar yeniden aktif hale gelir.
