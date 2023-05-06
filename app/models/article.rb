class Article < ApplicationRecord

    def get_article_status
        if(self.published)
            return "Published"
        else
            return "Not Published"
        end
    end
end
