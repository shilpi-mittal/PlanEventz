module VendorsHelper
    def rating_for_vendor(rateable_obj, dimension, foreign_key, id, options={})

      cached_average = rateable_obj.select(dimension).where(foreign_key+"=?", id)

      avg = cached_average ? calc_avg(cached_average, dimension) : 0

      star = options[:star] || 5

      disable_after_rate = options[:disable_after_rate] || true

      current_user = User.find_by("id=1")

      readonly = !(current_user)

      content_tag :div, '', "data-dimension" => dimension, :class => "star", "data-rating" => avg,
                  "data-id" => id, "data-classname" => rateable_obj.class.name,
                  "data-disable-after-rate" => disable_after_rate,
                  "data-readonly" => readonly,
                  "data-star-count" => star
    end

    def calc_avg(ratings, dimension)
      if ratings.size >0
        sum = 0
        ratings.each do |rating|
          sum = sum+rating[dimension]
        end
        avg = (sum.to_f)/(ratings.size.to_f)
        return avg

      else
        return 0
      end
    end

    def rating_for_user(rateable_obj, rating_user, dimension = nil, options = {})
      @object = rateable_obj
      @user = rating_user
      @rating = Rate.find_by_rater_id_and_rateable_id_and_dimension(@user.id, @object.id, dimension)
      stars = @rating ? @rating.stars : 0

      disable_after_rate = options[:disable_after_rate] || false

      readonly=false
      if disable_after_rate
        readonly = current_user.present? ? !rateable_obj.can_rate?(current_user.id, dimension) : true
      end

      content_tag :div, '', "data-dimension" => dimension, :class => "star", "data-rating" => stars,
                  "data-id" => rateable_obj.id, "data-classname" => rateable_obj.class.name,
                  "data-disable-after-rate" => disable_after_rate,
                  "data-readonly" => readonly,
                  "data-star-count" => stars
    end

end
