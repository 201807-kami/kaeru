class Artist < ApplicationRecord
	attachment :artist_image
	has_many :items

    def self.search(search) #self.でクラスメソッドとしている
	    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
	      Artist.where(['name LIKE ?', "%#{search}%"])
	    else
	      Artist.all #全て表示。
	    end
    end

end
