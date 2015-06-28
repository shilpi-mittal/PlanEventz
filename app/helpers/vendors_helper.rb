module VendorsHelper
    def overall_rating_for_vendor(rateable_obj, dimension, foreign_key, id, options={})

      cached_average = rateable_obj.select(dimension).where(foreign_key+"=?", id)

      avg = cached_average ? calc_avg(cached_average, dimension) : 0

      star = options[:star] || 5

      disable_after_rate = options[:disable_after_rate] || true

      readonly = true

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

    def rating_for_vendor(rateable_obj, dimension, id, options={})

      cached_average = rateable_obj.select(dimension).find(id)["rating"]

      avg = cached_average ? cached_average : 0

      star = options[:star] || 5

      disable_after_rate = options[:disable_after_rate] || true

      readonly = true

      content_tag :div, '', "data-dimension" => dimension, :class => "star", "data-rating" => avg,
                  "data-id" => id, "data-classname" => rateable_obj.class.name,
                  "data-disable-after-rate" => disable_after_rate,
                  "data-readonly" => readonly,
                  "data-star-count" => star
    end

    def add_rating_for_vendor(rateable_obj, dimension, id, options={})

      star = options[:star] || 5

      disable_after_rate = options[:disable_after_rate] || false

      content_tag :div, '', "data-dimension" => dimension, :class => "star", "data-rating" => 0,
                  "data-id" => id, "data-classname" => rateable_obj.class.name,
                  "data-disable-after-rate" => disable_after_rate,
                  "data-readonly" => false,
                  "data-star-count" => star

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

    def get_vendor_cover_photo(vendor_id)
      @vendor_photo = Vendor.find(vendor_id)['cover_pic']
    end

    def get_all_vendor_photos(vendor_id)
      @vendor_photo = VendorPhoto.where("vendor_id=?",vendor_id)
    end

    def get_category(vendor_id)
      category_id = Vendor.find(vendor_id)['category_id']
      VendorCategory.find(category_id)['category'].strip
    end

    def get_sub_category(vendor_id)
      sub_category_id = Vendor.find(vendor_id)['vendor_sub_category_id']
      VendorSubCategory.find(sub_category_id)['sub_category'].strip
    end

    def get_all_categories
      @vendor_categories = VendorCategory.all
    end

    def get_all_sub_categories
      @vendor_categories = VendorSubCategory.all
    end

    def show_review(vendor_id)
      @vendor_reviews_and_rating = VendorReviewsAndRating.where("vendor_id=?", vendor_id).order('created_at desc')
    end

    def get_number_of_reviews(vendor_id)
      show_review(vendor_id).count
    end
end
