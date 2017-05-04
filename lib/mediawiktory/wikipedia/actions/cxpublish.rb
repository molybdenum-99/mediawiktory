# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Save a page created using the Content Translation extension. 
    #
    # Usage:
    #

    # ```ruby
    # api.cxpublish(**options).perform # returns string with raw output
    # # or
    # api.cxpublish(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.cxpublish.title(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Cxpublish < MediaWiktory::Wikipedia::Actions::Post

      # The title of the page to perform actions on.
      #
      # @param value [String]
      # @return [self]
      def title(value)
        merge(title: value.to_s)
      end

      # The content to save.
      #
      # @param value [String]
      # @return [self]
      def html(value)
        merge(html: value.to_s)
      end

      # The source language code.
      #
      # @param value [String]
      # @return [self]
      def from(value)
        merge(from: value.to_s)
      end

      # The target language code.
      #
      # @param value [String]
      # @return [self]
      def to(value)
        merge(to: value.to_s)
      end

      # The title of the source page.
      #
      # @param value [String]
      # @return [self]
      def sourcetitle(value)
        merge(sourcetitle: value.to_s)
      end

      # The categories to put the published page in.
      #
      # @param value [String]
      # @return [self]
      def categories(value)
        merge(categories: value.to_s)
      end

      # Captcha ID (when saving with a captcha response).
      #
      # @param value [String]
      # @return [self]
      def wpCaptchaId(value)
        merge(wpCaptchaId: value.to_s)
      end

      # Answer to the captcha (when saving with a captcha response).
      #
      # @param value [String]
      # @return [self]
      def wpCaptchaWord(value)
        merge(wpCaptchaWord: value.to_s)
      end

      # A "csrf" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(token: value.to_s)
      end
    end
  end
end
