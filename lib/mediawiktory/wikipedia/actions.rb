# frozen_string_literal: true

require_relative './actions/base'

# Methods of this module contains all actions that can be used on {Api}.
# You use them like this:
#
# ```ruby
# api = MediaWiktory::Wikipedia::Api.new
#
# api.query                           # method of Api, returning Actions::Query
#    .titles('Argentina', 'Bolivia')  # methods of Actions::Query...
#    .prop(:revisions).prop(:content) # ...to set action options
#    .response
# # => performs action and returns Response instance
# ```
#
# See also:
# * {Api} for starting;
# * {Actions::Base} for details of working with actions;
# * and {Response}.
#
# Note that for each MediaWiki site the main method for **data extraction** (pages, categories,
# meta-information) is {#query}.
#
module MediaWiktory::Wikipedia::Actions

    # Check to see if an AbuseFilter matches a set of variables, editor logged AbuseFilter event.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Abusefiltercheckmatch} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Abusefiltercheckmatch} method calls, like
    #
    # ```ruby
    # api.abusefiltercheckmatch.filter('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Abusefiltercheckmatch} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Abusefiltercheckmatch]
    #
    def abusefiltercheckmatch
      Abusefiltercheckmatch.new(client, @defaults)
    end

    # Check syntax of an AbuseFilter filter.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Abusefilterchecksyntax} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Abusefilterchecksyntax} method calls, like
    #
    # ```ruby
    # api.abusefilterchecksyntax.filter('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Abusefilterchecksyntax} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Abusefilterchecksyntax]
    #
    def abusefilterchecksyntax
      Abusefilterchecksyntax.new(client, @defaults)
    end

    # Evaluates an AbuseFilter expression.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Abusefilterevalexpression} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Abusefilterevalexpression} method calls, like
    #
    # ```ruby
    # api.abusefilterevalexpression.expression('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Abusefilterevalexpression} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Abusefilterevalexpression]
    #
    def abusefilterevalexpression
      Abusefilterevalexpression.new(client, @defaults)
    end

    # Unblocks a user from receiving autopromotions due to an abusefilter consequence.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Abusefilterunblockautopromote} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Abusefilterunblockautopromote} method calls, like
    #
    # ```ruby
    # api.abusefilterunblockautopromote.user('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Abusefilterunblockautopromote} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Abusefilterunblockautopromote]
    #
    def abusefilterunblockautopromote
      Abusefilterunblockautopromote.new(client, @defaults)
    end

    # Add multiple students to a course.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Addstudents} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Addstudents} method calls, like
    #
    # ```ruby
    # api.addstudents.studentusernames('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Addstudents} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Addstudents]
    #
    def addstudents
      Addstudents.new(client, @defaults)
    end

    # Check a username against AntiSpoof's normalisation checks.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Antispoof} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Antispoof} method calls, like
    #
    # ```ruby
    # api.antispoof.username('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Antispoof} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Antispoof]
    #
    def antispoof
      Antispoof.new(client, @defaults)
    end

    # Block a user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Block} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Block} method calls, like
    #
    # ```ruby
    # api.block.user('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Block} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Block]
    #
    def block
      Block.new(client, @defaults)
    end

    # Receive a bounce email and process it to handle the failing recipient.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Bouncehandler} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Bouncehandler} method calls, like
    #
    # ```ruby
    # api.bouncehandler.email('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Bouncehandler} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Bouncehandler]
    #
    def bouncehandler
      Bouncehandler.new(client, @defaults)
    end

    # Internal module for the CategoryTree extension.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Categorytree} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Categorytree} method calls, like
    #
    # ```ruby
    # api.categorytree.category('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Categorytree} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Categorytree]
    #
    def categorytree
      Categorytree.new(client, @defaults)
    end

    # Fetch a centralauthtoken for making an authenticated request to an attached wiki.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Centralauthtoken} action.
    #

    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Centralauthtoken} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Centralauthtoken]
    #
    def centralauthtoken
      Centralauthtoken.new(client, @defaults)
    end

    # Get data needed to choose a banner for a given project and language
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Centralnoticechoicedata} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Centralnoticechoicedata} method calls, like
    #
    # ```ruby
    # api.centralnoticechoicedata.project('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Centralnoticechoicedata} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Centralnoticechoicedata]
    #
    def centralnoticechoicedata
      Centralnoticechoicedata.new(client, @defaults)
    end

    # Get all configuration settings for a campaign.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Centralnoticequerycampaign} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Centralnoticequerycampaign} method calls, like
    #
    # ```ruby
    # api.centralnoticequerycampaign.campaign('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Centralnoticequerycampaign} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Centralnoticequerycampaign]
    #
    def centralnoticequerycampaign
      Centralnoticequerycampaign.new(client, @defaults)
    end

    # Change authentication data for the current user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Changeauthenticationdata} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Changeauthenticationdata} method calls, like
    #
    # ```ruby
    # api.changeauthenticationdata.request('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Changeauthenticationdata} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Changeauthenticationdata]
    #
    def changeauthenticationdata
      Changeauthenticationdata.new(client, @defaults)
    end

    # Check the validity of a token from action=query&meta=tokens.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Checktoken} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Checktoken} method calls, like
    #
    # ```ruby
    # api.checktoken.type('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Checktoken} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Checktoken]
    #
    def checktoken
      Checktoken.new(client, @defaults)
    end

    # Dump of CirrusSearch configuration.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::CirrusConfigDump} action.
    #

    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::CirrusConfigDump} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::CirrusConfigDump]
    #
    def cirrus_config_dump
      CirrusConfigDump.new(client, @defaults)
    end

    # Dump of CirrusSearch mapping for this wiki.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::CirrusMappingDump} action.
    #

    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::CirrusMappingDump} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::CirrusMappingDump]
    #
    def cirrus_mapping_dump
      CirrusMappingDump.new(client, @defaults)
    end

    # Dump of CirrusSearch settings for this wiki.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::CirrusSettingsDump} action.
    #

    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::CirrusSettingsDump} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::CirrusSettingsDump]
    #
    def cirrus_settings_dump
      CirrusSettingsDump.new(client, @defaults)
    end

    # Clears the hasmsg flag for the current user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Clearhasmsg} action.
    #

    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Clearhasmsg} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Clearhasmsg]
    #
    def clearhasmsg
      Clearhasmsg.new(client, @defaults)
    end

    # Log in to the wiki using the interactive flow.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Clientlogin} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Clientlogin} method calls, like
    #
    # ```ruby
    # api.clientlogin.requests('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Clientlogin} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Clientlogin]
    #
    def clientlogin
      Clientlogin.new(client, @defaults)
    end

    # Get the difference between 2 pages.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Compare} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Compare} method calls, like
    #
    # ```ruby
    # api.compare.fromtitle('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Compare} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Compare]
    #
    def compare
      Compare.new(client, @defaults)
    end

    # Create a new user account.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Createaccount} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Createaccount} method calls, like
    #
    # ```ruby
    # api.createaccount.requests('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Createaccount} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Createaccount]
    #
    def createaccount
      Createaccount.new(client, @defaults)
    end

    # Used by browsers to report violations of the Content Security Policy. This module should never be used, except when used automatically by a CSP compliant web browser.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Cspreport} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Cspreport} method calls, like
    #
    # ```ruby
    # api.cspreport.reportonly('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Cspreport} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Cspreport]
    #
    def cspreport
      Cspreport.new(client, @defaults)
    end

    # Fetch the Content Translation configuration json for the given language pair.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Cxconfiguration} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Cxconfiguration} method calls, like
    #
    # ```ruby
    # api.cxconfiguration.from('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Cxconfiguration} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Cxconfiguration]
    #
    def cxconfiguration
      Cxconfiguration.new(client, @defaults)
    end

    # Delete a draft translation created using the Content Translation extension.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Cxdelete} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Cxdelete} method calls, like
    #
    # ```ruby
    # api.cxdelete.from('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Cxdelete} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Cxdelete]
    #
    def cxdelete
      Cxdelete.new(client, @defaults)
    end

    # Save a page created using the Content Translation extension.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Cxpublish} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Cxpublish} method calls, like
    #
    # ```ruby
    # api.cxpublish.title('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Cxpublish} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Cxpublish]
    #
    def cxpublish
      Cxpublish.new(client, @defaults)
    end

    # This module allows to save draft translations by section to save bandwidth and to collect parallel corpora.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Cxsave} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Cxsave} method calls, like
    #
    # ```ruby
    # api.cxsave.from('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Cxsave} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Cxsave]
    #
    def cxsave
      Cxsave.new(client, @defaults)
    end

    # Manage the suggestion lists. Add suggestions to lists and remove them.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Cxsuggestionlist} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Cxsuggestionlist} method calls, like
    #
    # ```ruby
    # api.cxsuggestionlist.listname('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Cxsuggestionlist} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Cxsuggestionlist]
    #
    def cxsuggestionlist
      Cxsuggestionlist.new(client, @defaults)
    end

    # Get JWT tokens to authenticate with cxserver.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Cxtoken} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Cxtoken} method calls, like
    #
    # ```ruby
    # api.cxtoken.token('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Cxtoken} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Cxtoken]
    #
    def cxtoken
      Cxtoken.new(client, @defaults)
    end

    # Delete a page.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Delete} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Delete} method calls, like
    #
    # ```ruby
    # api.delete.title('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Delete} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Delete]
    #
    def delete
      Delete.new(client, @defaults)
    end

    # Delete Education Program objects.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Deleteeducation} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Deleteeducation} method calls, like
    #
    # ```ruby
    # api.deleteeducation.ids('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Deleteeducation} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Deleteeducation]
    #
    def deleteeducation
      Deleteeducation.new(client, @defaults)
    end

    # Delete a global user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Deleteglobalaccount} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Deleteglobalaccount} method calls, like
    #
    # ```ruby
    # api.deleteglobalaccount.user('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Deleteglobalaccount} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Deleteglobalaccount]
    #
    def deleteglobalaccount
      Deleteglobalaccount.new(client, @defaults)
    end

    # Mark notifications as read for the current user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Echomarkread} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Echomarkread} method calls, like
    #
    # ```ruby
    # api.echomarkread.list('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Echomarkread} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Echomarkread]
    #
    def echomarkread
      Echomarkread.new(client, @defaults)
    end

    # Mark notifications as seen for the current user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Echomarkseen} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Echomarkseen} method calls, like
    #
    # ```ruby
    # api.echomarkseen.token('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Echomarkseen} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Echomarkseen]
    #
    def echomarkseen
      Echomarkseen.new(client, @defaults)
    end

    # Create and edit pages.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Edit} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Edit} method calls, like
    #
    # ```ruby
    # api.edit.title('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Edit} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Edit]
    #
    def edit
      Edit.new(client, @defaults)
    end

    # Edit a mass message delivery list.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Editmassmessagelist} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Editmassmessagelist} method calls, like
    #
    # ```ruby
    # api.editmassmessagelist.spamlist('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Editmassmessagelist} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Editmassmessagelist]
    #
    def editmassmessagelist
      Editmassmessagelist.new(client, @defaults)
    end

    # Email a user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Emailuser} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Emailuser} method calls, like
    #
    # ```ruby
    # api.emailuser.target('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Emailuser} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Emailuser]
    #
    def emailuser
      Emailuser.new(client, @defaults)
    end

    # Associate or disassociate a user as instructor or volunteer for a course.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Enlist} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Enlist} method calls, like
    #
    # ```ruby
    # api.enlist.subaction('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Enlist} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Enlist]
    #
    def enlist
      Enlist.new(client, @defaults)
    end

    # Expands all templates within wikitext.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Expandtemplates} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Expandtemplates} method calls, like
    #
    # ```ruby
    # api.expandtemplates.title('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Expandtemplates} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Expandtemplates]
    #
    def expandtemplates
      Expandtemplates.new(client, @defaults)
    end

    # Get a new FancyCaptcha.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Fancycaptchareload} action.
    #

    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Fancycaptchareload} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Fancycaptchareload]
    #
    def fancycaptchareload
      Fancycaptchareload.new(client, @defaults)
    end

    # Returns a featured content feed.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Featuredfeed} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Featuredfeed} method calls, like
    #
    # ```ruby
    # api.featuredfeed.feedformat('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Featuredfeed} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Featuredfeed]
    #
    def featuredfeed
      Featuredfeed.new(client, @defaults)
    end

    # Returns a user contributions feed.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Feedcontributions} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Feedcontributions} method calls, like
    #
    # ```ruby
    # api.feedcontributions.feedformat('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Feedcontributions} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Feedcontributions]
    #
    def feedcontributions
      Feedcontributions.new(client, @defaults)
    end

    # Returns a recent changes feed.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Feedrecentchanges} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Feedrecentchanges} method calls, like
    #
    # ```ruby
    # api.feedrecentchanges.feedformat('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Feedrecentchanges} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Feedrecentchanges]
    #
    def feedrecentchanges
      Feedrecentchanges.new(client, @defaults)
    end

    # Returns a watchlist feed.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Feedwatchlist} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Feedwatchlist} method calls, like
    #
    # ```ruby
    # api.feedwatchlist.feedformat('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Feedwatchlist} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Feedwatchlist]
    #
    def feedwatchlist
      Feedwatchlist.new(client, @defaults)
    end

    # Revert a file to an old version.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Filerevert} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Filerevert} method calls, like
    #
    # ```ruby
    # api.filerevert.filename('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Filerevert} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Filerevert]
    #
    def filerevert
      Filerevert.new(client, @defaults)
    end

    # Get basic information about review flag configuration for this site.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Flagconfig} action.
    #

    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Flagconfig} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Flagconfig]
    #
    def flagconfig
      Flagconfig.new(client, @defaults)
    end

    # Globally block or unblock a user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Globalblock} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Globalblock} method calls, like
    #
    # ```ruby
    # api.globalblock.target('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Globalblock} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Globalblock]
    #
    def globalblock
      Globalblock.new(client, @defaults)
    end

    # Add/remove a user to/from global groups.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Globaluserrights} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Globaluserrights} method calls, like
    #
    # ```ruby
    # api.globaluserrights.user('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Globaluserrights} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Globaluserrights]
    #
    def globaluserrights
      Globaluserrights.new(client, @defaults)
    end

    # Access graph tag functionality.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Graph} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Graph} method calls, like
    #
    # ```ruby
    # api.graph.hash('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Graph} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Graph]
    #
    def graph
      Graph.new(client, @defaults)
    end

    # Display help for the specified modules.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Help} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Help} method calls, like
    #
    # ```ruby
    # api.help.modules('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Help} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Help]
    #
    def help
      Help.new(client, @defaults)
    end

    # This module has been disabled.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Imagerotate} action.
    #

    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Imagerotate} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Imagerotate]
    #
    def imagerotate
      Imagerotate.new(client, @defaults)
    end

    # Import a page from another wiki, or from an XML file.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Import} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Import} method calls, like
    #
    # ```ruby
    # api.import.summary('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Import} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Import]
    #
    def import
      Import.new(client, @defaults)
    end

    # Allows direct access to JsonConfig subsystem.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Jsonconfig} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Jsonconfig} method calls, like
    #
    # ```ruby
    # api.jsonconfig.command('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Jsonconfig} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Jsonconfig]
    #
    def jsonconfig
      Jsonconfig.new(client, @defaults)
    end

    # Retrieve localized JSON data.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Jsondata} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Jsondata} method calls, like
    #
    # ```ruby
    # api.jsondata.title('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Jsondata} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Jsondata]
    #
    def jsondata
      Jsondata.new(client, @defaults)
    end

    # Search for language names in any script.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Languagesearch} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Languagesearch} method calls, like
    #
    # ```ruby
    # api.languagesearch.search('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Languagesearch} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Languagesearch]
    #
    def languagesearch
      Languagesearch.new(client, @defaults)
    end

    # Link an account from a third-party provider to the current user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Linkaccount} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Linkaccount} method calls, like
    #
    # ```ruby
    # api.linkaccount.requests('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Linkaccount} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Linkaccount]
    #
    def linkaccount
      Linkaccount.new(client, @defaults)
    end

    # Get the usernames and other information for students enrolled in one or more courses.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Liststudents} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Liststudents} method calls, like
    #
    # ```ruby
    # api.liststudents.courseids('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Liststudents} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Liststudents]
    #
    def liststudents
      Liststudents.new(client, @defaults)
    end

    # Log in and get authentication cookies.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Login} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Login} method calls, like
    #
    # ```ruby
    # api.login.name('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Login} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Login]
    #
    def login
      Login.new(client, @defaults)
    end

    # Log out and clear session data.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Logout} action.
    #

    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Logout} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Logout]
    #
    def logout
      Logout.new(client, @defaults)
    end

    # Perform management tasks relating to change tags.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Managetags} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Managetags} method calls, like
    #
    # ```ruby
    # api.managetags.operation('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Managetags} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Managetags]
    #
    def managetags
      Managetags.new(client, @defaults)
    end

    # Send a message to a list of pages.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Massmessage} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Massmessage} method calls, like
    #
    # ```ruby
    # api.massmessage.spamlist('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Massmessage} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Massmessage]
    #
    def massmessage
      Massmessage.new(client, @defaults)
    end

    # Merge page histories.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Mergehistory} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Mergehistory} method calls, like
    #
    # ```ruby
    # api.mergehistory.from('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Mergehistory} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Mergehistory]
    #
    def mergehistory
      Mergehistory.new(client, @defaults)
    end

    # Returns data needed for mobile views.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Mobileview} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Mobileview} method calls, like
    #
    # ```ruby
    # api.mobileview.page('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Mobileview} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Mobileview]
    #
    def mobileview
      Mobileview.new(client, @defaults)
    end

    # Move a page.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Move} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Move} method calls, like
    #
    # ```ruby
    # api.move.from('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Move} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Move]
    #
    def move
      Move.new(client, @defaults)
    end

    # Validate a two-factor authentication (OATH) token.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Oathvalidate} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Oathvalidate} method calls, like
    #
    # ```ruby
    # api.oathvalidate.user('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Oathvalidate} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Oathvalidate]
    #
    def oathvalidate
      Oathvalidate.new(client, @defaults)
    end

    # Search the wiki using the OpenSearch protocol.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Opensearch} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Opensearch} method calls, like
    #
    # ```ruby
    # api.opensearch.search('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Opensearch} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Opensearch]
    #
    def opensearch
      Opensearch.new(client, @defaults)
    end

    # Change preferences of the current user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Options} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Options} method calls, like
    #
    # ```ruby
    # api.options.reset('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Options} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Options]
    #
    def options
      Options.new(client, @defaults)
    end

    # Mark an article as reviewed or unreviewed.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Pagetriageaction} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Pagetriageaction} method calls, like
    #
    # ```ruby
    # api.pagetriageaction.pageid('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Pagetriageaction} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Pagetriageaction]
    #
    def pagetriageaction
      Pagetriageaction.new(client, @defaults)
    end

    # Get a list of page IDs for building a PageTriage queue.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Pagetriagelist} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Pagetriagelist} method calls, like
    #
    # ```ruby
    # api.pagetriagelist.page_id('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Pagetriagelist} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Pagetriagelist]
    #
    def pagetriagelist
      Pagetriagelist.new(client, @defaults)
    end

    # Get the stats for page triage.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Pagetriagestats} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Pagetriagestats} method calls, like
    #
    # ```ruby
    # api.pagetriagestats.namespace('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Pagetriagestats} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Pagetriagestats]
    #
    def pagetriagestats
      Pagetriagestats.new(client, @defaults)
    end

    # Add tags to an article.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Pagetriagetagging} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Pagetriagetagging} method calls, like
    #
    # ```ruby
    # api.pagetriagetagging.pageid('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Pagetriagetagging} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Pagetriagetagging]
    #
    def pagetriagetagging
      Pagetriagetagging.new(client, @defaults)
    end

    # Fetch templates that are used within the PageTriage application.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Pagetriagetemplate} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Pagetriagetemplate} method calls, like
    #
    # ```ruby
    # api.pagetriagetemplate.view('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Pagetriagetemplate} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Pagetriagetemplate]
    #
    def pagetriagetemplate
      Pagetriagetemplate.new(client, @defaults)
    end

    # Obtain information about API modules.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Paraminfo} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Paraminfo} method calls, like
    #
    # ```ruby
    # api.paraminfo.modules('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Paraminfo} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Paraminfo]
    #
    def paraminfo
      Paraminfo.new(client, @defaults)
    end

    # Parses content and returns parser output.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Parse} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Parse} method calls, like
    #
    # ```ruby
    # api.parse.title('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Parse} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Parse]
    #
    def parse
      Parse.new(client, @defaults)
    end

    # 
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::ParsoidBatch} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::ParsoidBatch} method calls, like
    #
    # ```ruby
    # api.parsoid_batch.batch('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::ParsoidBatch} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::ParsoidBatch]
    #
    def parsoid_batch
      ParsoidBatch.new(client, @defaults)
    end

    # Patrol a page or revision.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Patrol} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Patrol} method calls, like
    #
    # ```ruby
    # api.patrol.rcid('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Patrol} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Patrol]
    #
    def patrol
      Patrol.new(client, @defaults)
    end

    # Change the protection level of a page.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Protect} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Protect} method calls, like
    #
    # ```ruby
    # api.protect.title('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Protect} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Protect]
    #
    def protect
      Protect.new(client, @defaults)
    end

    # Purge the cache for the given titles.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Purge} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Purge} method calls, like
    #
    # ```ruby
    # api.purge.forcelinkupdate('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Purge} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Purge]
    #
    def purge
      Purge.new(client, @defaults)
    end

    # Fetch data from and about MediaWiki.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Query} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Query} method calls, like
    #
    # ```ruby
    # api.query.prop('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Query} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Query]
    #
    def query
      Query.new(client, @defaults)
    end

    # Rebuild summary data of Education Program objects.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Refresheducation} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Refresheducation} method calls, like
    #
    # ```ruby
    # api.refresheducation.ids('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Refresheducation} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Refresheducation]
    #
    def refresheducation
      Refresheducation.new(client, @defaults)
    end

    # Remove authentication data for the current user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Removeauthenticationdata} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Removeauthenticationdata} method calls, like
    #
    # ```ruby
    # api.removeauthenticationdata.request('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Removeauthenticationdata} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Removeauthenticationdata]
    #
    def removeauthenticationdata
      Removeauthenticationdata.new(client, @defaults)
    end

    # Send a password reset email to a user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Resetpassword} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Resetpassword} method calls, like
    #
    # ```ruby
    # api.resetpassword.user('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Resetpassword} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Resetpassword]
    #
    def resetpassword
      Resetpassword.new(client, @defaults)
    end

    # Review a revision by approving or de-approving it.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Review} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Review} method calls, like
    #
    # ```ruby
    # api.review.revid('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Review} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Review]
    #
    def review
      Review.new(client, @defaults)
    end

    # Advertise or de-advertise yourself as reviewing an unreviewed page or unreviewed changes.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Reviewactivity} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Reviewactivity} method calls, like
    #
    # ```ruby
    # api.reviewactivity.previd('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Reviewactivity} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Reviewactivity]
    #
    def reviewactivity
      Reviewactivity.new(client, @defaults)
    end

    # Delete and undelete revisions.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Revisiondelete} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Revisiondelete} method calls, like
    #
    # ```ruby
    # api.revisiondelete.type('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Revisiondelete} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Revisiondelete]
    #
    def revisiondelete
      Revisiondelete.new(client, @defaults)
    end

    # Undo the last edit to the page.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Rollback} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Rollback} method calls, like
    #
    # ```ruby
    # api.rollback.title('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Rollback} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Rollback]
    #
    def rollback
      Rollback.new(client, @defaults)
    end

    # Export an RSD (Really Simple Discovery) schema.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Rsd} action.
    #

    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Rsd} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Rsd]
    #
    def rsd
      Rsd.new(client, @defaults)
    end

    # Performs data validation for Kartographer extension
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::SanitizeMapdata} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::SanitizeMapdata} method calls, like
    #
    # ```ruby
    # api.sanitize_mapdata.title('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::SanitizeMapdata} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::SanitizeMapdata]
    #
    def sanitize_mapdata
      SanitizeMapdata.new(client, @defaults)
    end

    # Internal module for servicing XHR requests from the Scribunto console.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::ScribuntoConsole} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::ScribuntoConsole} method calls, like
    #
    # ```ruby
    # api.scribunto_console.title('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::ScribuntoConsole} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::ScribuntoConsole]
    #
    def scribunto_console
      ScribuntoConsole.new(client, @defaults)
    end

    # Set a global user's status.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Setglobalaccountstatus} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Setglobalaccountstatus} method calls, like
    #
    # ```ruby
    # api.setglobalaccountstatus.user('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Setglobalaccountstatus} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Setglobalaccountstatus]
    #
    def setglobalaccountstatus
      Setglobalaccountstatus.new(client, @defaults)
    end

    # Update the notification timestamp for watched pages.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Setnotificationtimestamp} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Setnotificationtimestamp} method calls, like
    #
    # ```ruby
    # api.setnotificationtimestamp.entirewatchlist('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Setnotificationtimestamp} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Setnotificationtimestamp]
    #
    def setnotificationtimestamp
      Setnotificationtimestamp.new(client, @defaults)
    end

    # Changing the language of a page is not allowed on this wiki.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Setpagelanguage} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Setpagelanguage} method calls, like
    #
    # ```ruby
    # api.setpagelanguage.title('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Setpagelanguage} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Setpagelanguage]
    #
    def setpagelanguage
      Setpagelanguage.new(client, @defaults)
    end

    # Shorten a long URL into a shorter one.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Shortenurl} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Shortenurl} method calls, like
    #
    # ```ruby
    # api.shortenurl.url('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Shortenurl} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Shortenurl]
    #
    def shortenurl
      Shortenurl.new(client, @defaults)
    end

    # Get Wikimedia sites list.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Sitematrix} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Sitematrix} method calls, like
    #
    # ```ruby
    # api.sitematrix.type('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Sitematrix} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Sitematrix]
    #
    def sitematrix
      Sitematrix.new(client, @defaults)
    end

    # Validate one or more URLs against the SpamBlacklist.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Spamblacklist} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Spamblacklist} method calls, like
    #
    # ```ruby
    # api.spamblacklist.url('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Spamblacklist} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Spamblacklist]
    #
    def spamblacklist
      Spamblacklist.new(client, @defaults)
    end

    # Configure review-protection settings for a page.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Stabilize} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Stabilize} method calls, like
    #
    # ```ruby
    # api.stabilize.protectlevel('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Stabilize} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Stabilize]
    #
    def stabilize
      Stabilize.new(client, @defaults)
    end

    # Prepare an edit in shared cache.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Stashedit} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Stashedit} method calls, like
    #
    # ```ruby
    # api.stashedit.title('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Stashedit} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Stashedit]
    #
    def stashedit
      Stashedit.new(client, @defaults)
    end

    # Allows admins to strike or unstrike a vote.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Strikevote} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Strikevote} method calls, like
    #
    # ```ruby
    # api.strikevote.option('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Strikevote} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Strikevote]
    #
    def strikevote
      Strikevote.new(client, @defaults)
    end

    # Add or remove change tags from individual revisions or log entries.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Tag} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Tag} method calls, like
    #
    # ```ruby
    # api.tag.rcid('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Tag} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Tag]
    #
    def tag
      Tag.new(client, @defaults)
    end

    # Fetch data stored by the TemplateData extension.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Templatedata} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Templatedata} method calls, like
    #
    # ```ruby
    # api.templatedata.titles('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Templatedata} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Templatedata]
    #
    def templatedata
      Templatedata.new(client, @defaults)
    end

    # Send a thank-you notification to an editor.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Thank} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Thank} method calls, like
    #
    # ```ruby
    # api.thank.rev('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Thank} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Thank]
    #
    def thank
      Thank.new(client, @defaults)
    end

    # Validate an article title, filename, or username against the TitleBlacklist.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Titleblacklist} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Titleblacklist} method calls, like
    #
    # ```ruby
    # api.titleblacklist.title('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Titleblacklist} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Titleblacklist]
    #
    def titleblacklist
      Titleblacklist.new(client, @defaults)
    end

    # Get tokens for data-modifying actions.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Tokens} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Tokens} method calls, like
    #
    # ```ruby
    # api.tokens.type('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Tokens} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Tokens]
    #
    def tokens
      Tokens.new(client, @defaults)
    end

    # Users with the 'transcode-reset' right can reset and re-run a transcode job.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Transcodereset} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Transcodereset} method calls, like
    #
    # ```ruby
    # api.transcodereset.title('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Transcodereset} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Transcodereset]
    #
    def transcodereset
      Transcodereset.new(client, @defaults)
    end

    # Get the localization of ULS in the given language.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Ulslocalization} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Ulslocalization} method calls, like
    #
    # ```ruby
    # api.ulslocalization.language('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Ulslocalization} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Ulslocalization]
    #
    def ulslocalization
      Ulslocalization.new(client, @defaults)
    end

    # Unblock a user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Unblock} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Unblock} method calls, like
    #
    # ```ruby
    # api.unblock.id('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Unblock} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Unblock]
    #
    def unblock
      Unblock.new(client, @defaults)
    end

    # Restore revisions of a deleted page.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Undelete} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Undelete} method calls, like
    #
    # ```ruby
    # api.undelete.title('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Undelete} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Undelete]
    #
    def undelete
      Undelete.new(client, @defaults)
    end

    # Remove a linked third-party account from the current user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Unlinkaccount} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Unlinkaccount} method calls, like
    #
    # ```ruby
    # api.unlinkaccount.request('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Unlinkaccount} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Unlinkaccount]
    #
    def unlinkaccount
      Unlinkaccount.new(client, @defaults)
    end

    # Upload a file, or get the status of pending uploads.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Upload} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Upload} method calls, like
    #
    # ```ruby
    # api.upload.filename('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Upload} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Upload]
    #
    def upload
      Upload.new(client, @defaults)
    end

    # Change a user's group membership.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Userrights} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Userrights} method calls, like
    #
    # ```ruby
    # api.userrights.user('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Userrights} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Userrights]
    #
    def userrights
      Userrights.new(client, @defaults)
    end

    # Validate a password against the wiki's password policies.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Validatepassword} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Validatepassword} method calls, like
    #
    # ```ruby
    # api.validatepassword.password('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Validatepassword} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Validatepassword]
    #
    def validatepassword
      Validatepassword.new(client, @defaults)
    end

    # Returns HTML5 for a page from the Parsoid service.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Visualeditor} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Visualeditor} method calls, like
    #
    # ```ruby
    # api.visualeditor.page('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Visualeditor} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Visualeditor]
    #
    def visualeditor
      Visualeditor.new(client, @defaults)
    end

    # Save an HTML5 page to MediaWiki (converted to wikitext via the Parsoid service).
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Visualeditoredit} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Visualeditoredit} method calls, like
    #
    # ```ruby
    # api.visualeditoredit.paction('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Visualeditoredit} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Visualeditoredit]
    #
    def visualeditoredit
      Visualeditoredit.new(client, @defaults)
    end

    # Add or remove pages from the current user's watchlist.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Watch} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Watch} method calls, like
    #
    # ```ruby
    # api.watch.title('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Watch} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Watch]
    #
    def watch
      Watch.new(client, @defaults)
    end

    # Returns a webapp manifest.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::WebappManifest} action.
    #

    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::WebappManifest} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::WebappManifest]
    #
    def webapp_manifest
      WebappManifest.new(client, @defaults)
    end

    # Give WikiLove to another user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Wikilove} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Wikilove} method calls, like
    #
    # ```ruby
    # api.wikilove.title('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Wikilove} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Wikilove]
    #
    def wikilove
      Wikilove.new(client, @defaults)
    end

    # Get configuration of the Zero extension.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Zeroconfig} action.
    #
    # Action parameters could be passed or by subsequent
    # {MediaWiktory::Wikipedia::Actions::Zeroconfig} method calls, like
    #
    # ```ruby
    # api.zeroconfig.type('value')
    # ```
    #
    # See {MediaWiktory::Wikipedia::Actions::Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Zeroconfig} class for a list of parameters and usage.
    #
    # @return [MediaWiktory::Wikipedia::Actions::Zeroconfig]
    #
    def zeroconfig
      Zeroconfig.new(client, @defaults)
    end
end

Dir[File.expand_path('../{actions,modules}/*.rb', __FILE__)].each { |f| require f }
