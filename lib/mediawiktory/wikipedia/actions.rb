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
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.abusefiltercheckmatch(filter: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Abusefiltercheckmatch} method calls, like
    #
    # ```ruby
    # api.abusefiltercheckmatch.filter('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Abusefiltercheckmatch} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Abusefiltercheckmatch]
    #
    def abusefiltercheckmatch(**options)
      Abusefiltercheckmatch.new(client, @defaults.merge(**options))
    end

    # Check syntax of an AbuseFilter filter.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Abusefilterchecksyntax} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.abusefilterchecksyntax(filter: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Abusefilterchecksyntax} method calls, like
    #
    # ```ruby
    # api.abusefilterchecksyntax.filter('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Abusefilterchecksyntax} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Abusefilterchecksyntax]
    #
    def abusefilterchecksyntax(**options)
      Abusefilterchecksyntax.new(client, @defaults.merge(**options))
    end

    # Evaluates an AbuseFilter expression.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Abusefilterevalexpression} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.abusefilterevalexpression(expression: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Abusefilterevalexpression} method calls, like
    #
    # ```ruby
    # api.abusefilterevalexpression.expression('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Abusefilterevalexpression} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Abusefilterevalexpression]
    #
    def abusefilterevalexpression(**options)
      Abusefilterevalexpression.new(client, @defaults.merge(**options))
    end

    # Unblocks a user from receiving autopromotions due to an abusefilter consequence.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Abusefilterunblockautopromote} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.abusefilterunblockautopromote(user: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Abusefilterunblockautopromote} method calls, like
    #
    # ```ruby
    # api.abusefilterunblockautopromote.user('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Abusefilterunblockautopromote} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Abusefilterunblockautopromote]
    #
    def abusefilterunblockautopromote(**options)
      Abusefilterunblockautopromote.new(client, @defaults.merge(**options))
    end

    # Add multiple students to a course.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Addstudents} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.addstudents(studentusernames: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Addstudents} method calls, like
    #
    # ```ruby
    # api.addstudents.studentusernames('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Addstudents} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Addstudents]
    #
    def addstudents(**options)
      Addstudents.new(client, @defaults.merge(**options))
    end

    # Check a username against AntiSpoof's normalisation checks.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Antispoof} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.antispoof(username: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Antispoof} method calls, like
    #
    # ```ruby
    # api.antispoof.username('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Antispoof} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Antispoof]
    #
    def antispoof(**options)
      Antispoof.new(client, @defaults.merge(**options))
    end

    # Block a user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Block} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.block(user: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Block} method calls, like
    #
    # ```ruby
    # api.block.user('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Block} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Block]
    #
    def block(**options)
      Block.new(client, @defaults.merge(**options))
    end

    # Receive a bounce email and process it to handle the failing recipient.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Bouncehandler} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.bouncehandler(email: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Bouncehandler} method calls, like
    #
    # ```ruby
    # api.bouncehandler.email('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Bouncehandler} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Bouncehandler]
    #
    def bouncehandler(**options)
      Bouncehandler.new(client, @defaults.merge(**options))
    end

    # Internal module for the CategoryTree extension.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Categorytree} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.categorytree(category: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Categorytree} method calls, like
    #
    # ```ruby
    # api.categorytree.category('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Categorytree} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Categorytree]
    #
    def categorytree(**options)
      Categorytree.new(client, @defaults.merge(**options))
    end

    # Fetch a centralauthtoken for making an authenticated request to an attached wiki.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Centralauthtoken} action.
    #

    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Centralauthtoken} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Centralauthtoken]
    #
    def centralauthtoken(**options)
      Centralauthtoken.new(client, @defaults.merge(**options))
    end

    # Get data needed to choose a banner for a given project and language
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Centralnoticechoicedata} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.centralnoticechoicedata(project: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Centralnoticechoicedata} method calls, like
    #
    # ```ruby
    # api.centralnoticechoicedata.project('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Centralnoticechoicedata} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Centralnoticechoicedata]
    #
    def centralnoticechoicedata(**options)
      Centralnoticechoicedata.new(client, @defaults.merge(**options))
    end

    # Get all configuration settings for a campaign.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Centralnoticequerycampaign} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.centralnoticequerycampaign(campaign: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Centralnoticequerycampaign} method calls, like
    #
    # ```ruby
    # api.centralnoticequerycampaign.campaign('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Centralnoticequerycampaign} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Centralnoticequerycampaign]
    #
    def centralnoticequerycampaign(**options)
      Centralnoticequerycampaign.new(client, @defaults.merge(**options))
    end

    # Change authentication data for the current user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Changeauthenticationdata} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.changeauthenticationdata(request: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Changeauthenticationdata} method calls, like
    #
    # ```ruby
    # api.changeauthenticationdata.request('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Changeauthenticationdata} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Changeauthenticationdata]
    #
    def changeauthenticationdata(**options)
      Changeauthenticationdata.new(client, @defaults.merge(**options))
    end

    # Check the validity of a token from action=query&meta=tokens.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Checktoken} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.checktoken(type: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Checktoken} method calls, like
    #
    # ```ruby
    # api.checktoken.type('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Checktoken} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Checktoken]
    #
    def checktoken(**options)
      Checktoken.new(client, @defaults.merge(**options))
    end

    # Dump of CirrusSearch configuration.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::CirrusConfigDump} action.
    #

    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::CirrusConfigDump} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::CirrusConfigDump]
    #
    def cirrus_config_dump(**options)
      CirrusConfigDump.new(client, @defaults.merge(**options))
    end

    # Dump of CirrusSearch mapping for this wiki.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::CirrusMappingDump} action.
    #

    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::CirrusMappingDump} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::CirrusMappingDump]
    #
    def cirrus_mapping_dump(**options)
      CirrusMappingDump.new(client, @defaults.merge(**options))
    end

    # Dump of CirrusSearch settings for this wiki.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::CirrusSettingsDump} action.
    #

    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::CirrusSettingsDump} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::CirrusSettingsDump]
    #
    def cirrus_settings_dump(**options)
      CirrusSettingsDump.new(client, @defaults.merge(**options))
    end

    # Clears the hasmsg flag for the current user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Clearhasmsg} action.
    #

    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Clearhasmsg} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Clearhasmsg]
    #
    def clearhasmsg(**options)
      Clearhasmsg.new(client, @defaults.merge(**options))
    end

    # Log in to the wiki using the interactive flow.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Clientlogin} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.clientlogin(requests: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Clientlogin} method calls, like
    #
    # ```ruby
    # api.clientlogin.requests('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Clientlogin} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Clientlogin]
    #
    def clientlogin(**options)
      Clientlogin.new(client, @defaults.merge(**options))
    end

    # Get the difference between 2 pages.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Compare} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.compare(fromtitle: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Compare} method calls, like
    #
    # ```ruby
    # api.compare.fromtitle('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Compare} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Compare]
    #
    def compare(**options)
      Compare.new(client, @defaults.merge(**options))
    end

    # Create a new user account.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Createaccount} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.createaccount(requests: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Createaccount} method calls, like
    #
    # ```ruby
    # api.createaccount.requests('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Createaccount} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Createaccount]
    #
    def createaccount(**options)
      Createaccount.new(client, @defaults.merge(**options))
    end

    # Used by browsers to report violations of the Content Security Policy. This module should never be used, except when used automatically by a CSP compliant web browser.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Cspreport} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.cspreport(reportonly: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Cspreport} method calls, like
    #
    # ```ruby
    # api.cspreport.reportonly('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Cspreport} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Cspreport]
    #
    def cspreport(**options)
      Cspreport.new(client, @defaults.merge(**options))
    end

    # Fetch the Content Translation configuration json for the given language pair.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Cxconfiguration} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.cxconfiguration(from: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Cxconfiguration} method calls, like
    #
    # ```ruby
    # api.cxconfiguration.from('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Cxconfiguration} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Cxconfiguration]
    #
    def cxconfiguration(**options)
      Cxconfiguration.new(client, @defaults.merge(**options))
    end

    # Delete a draft translation created using the Content Translation extension.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Cxdelete} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.cxdelete(from: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Cxdelete} method calls, like
    #
    # ```ruby
    # api.cxdelete.from('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Cxdelete} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Cxdelete]
    #
    def cxdelete(**options)
      Cxdelete.new(client, @defaults.merge(**options))
    end

    # Save a page created using the Content Translation extension.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Cxpublish} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.cxpublish(title: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Cxpublish} method calls, like
    #
    # ```ruby
    # api.cxpublish.title('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Cxpublish} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Cxpublish]
    #
    def cxpublish(**options)
      Cxpublish.new(client, @defaults.merge(**options))
    end

    # This module allows to save draft translations by section to save bandwidth and to collect parallel corpora.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Cxsave} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.cxsave(from: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Cxsave} method calls, like
    #
    # ```ruby
    # api.cxsave.from('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Cxsave} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Cxsave]
    #
    def cxsave(**options)
      Cxsave.new(client, @defaults.merge(**options))
    end

    # Manage the suggestion lists. Add suggestions to lists and remove them.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Cxsuggestionlist} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.cxsuggestionlist(listname: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Cxsuggestionlist} method calls, like
    #
    # ```ruby
    # api.cxsuggestionlist.listname('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Cxsuggestionlist} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Cxsuggestionlist]
    #
    def cxsuggestionlist(**options)
      Cxsuggestionlist.new(client, @defaults.merge(**options))
    end

    # Get JWT tokens to authenticate with cxserver.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Cxtoken} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.cxtoken(token: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Cxtoken} method calls, like
    #
    # ```ruby
    # api.cxtoken.token('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Cxtoken} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Cxtoken]
    #
    def cxtoken(**options)
      Cxtoken.new(client, @defaults.merge(**options))
    end

    # Delete a page.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Delete} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.delete(title: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Delete} method calls, like
    #
    # ```ruby
    # api.delete.title('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Delete} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Delete]
    #
    def delete(**options)
      Delete.new(client, @defaults.merge(**options))
    end

    # Delete Education Program objects.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Deleteeducation} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.deleteeducation(ids: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Deleteeducation} method calls, like
    #
    # ```ruby
    # api.deleteeducation.ids('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Deleteeducation} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Deleteeducation]
    #
    def deleteeducation(**options)
      Deleteeducation.new(client, @defaults.merge(**options))
    end

    # Delete a global user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Deleteglobalaccount} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.deleteglobalaccount(user: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Deleteglobalaccount} method calls, like
    #
    # ```ruby
    # api.deleteglobalaccount.user('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Deleteglobalaccount} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Deleteglobalaccount]
    #
    def deleteglobalaccount(**options)
      Deleteglobalaccount.new(client, @defaults.merge(**options))
    end

    # Mark notifications as read for the current user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Echomarkread} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.echomarkread(list: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Echomarkread} method calls, like
    #
    # ```ruby
    # api.echomarkread.list('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Echomarkread} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Echomarkread]
    #
    def echomarkread(**options)
      Echomarkread.new(client, @defaults.merge(**options))
    end

    # Mark notifications as seen for the current user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Echomarkseen} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.echomarkseen(token: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Echomarkseen} method calls, like
    #
    # ```ruby
    # api.echomarkseen.token('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Echomarkseen} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Echomarkseen]
    #
    def echomarkseen(**options)
      Echomarkseen.new(client, @defaults.merge(**options))
    end

    # Create and edit pages.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Edit} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.edit(title: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Edit} method calls, like
    #
    # ```ruby
    # api.edit.title('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Edit} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Edit]
    #
    def edit(**options)
      Edit.new(client, @defaults.merge(**options))
    end

    # Edit a mass message delivery list.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Editmassmessagelist} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.editmassmessagelist(spamlist: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Editmassmessagelist} method calls, like
    #
    # ```ruby
    # api.editmassmessagelist.spamlist('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Editmassmessagelist} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Editmassmessagelist]
    #
    def editmassmessagelist(**options)
      Editmassmessagelist.new(client, @defaults.merge(**options))
    end

    # Email a user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Emailuser} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.emailuser(target: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Emailuser} method calls, like
    #
    # ```ruby
    # api.emailuser.target('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Emailuser} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Emailuser]
    #
    def emailuser(**options)
      Emailuser.new(client, @defaults.merge(**options))
    end

    # Associate or disassociate a user as instructor or volunteer for a course.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Enlist} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.enlist(subaction: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Enlist} method calls, like
    #
    # ```ruby
    # api.enlist.subaction('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Enlist} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Enlist]
    #
    def enlist(**options)
      Enlist.new(client, @defaults.merge(**options))
    end

    # Expands all templates within wikitext.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Expandtemplates} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.expandtemplates(title: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Expandtemplates} method calls, like
    #
    # ```ruby
    # api.expandtemplates.title('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Expandtemplates} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Expandtemplates]
    #
    def expandtemplates(**options)
      Expandtemplates.new(client, @defaults.merge(**options))
    end

    # Get a new FancyCaptcha.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Fancycaptchareload} action.
    #

    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Fancycaptchareload} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Fancycaptchareload]
    #
    def fancycaptchareload(**options)
      Fancycaptchareload.new(client, @defaults.merge(**options))
    end

    # Returns a featured content feed.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Featuredfeed} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.featuredfeed(feedformat: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Featuredfeed} method calls, like
    #
    # ```ruby
    # api.featuredfeed.feedformat('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Featuredfeed} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Featuredfeed]
    #
    def featuredfeed(**options)
      Featuredfeed.new(client, @defaults.merge(**options))
    end

    # Returns a user contributions feed.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Feedcontributions} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.feedcontributions(feedformat: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Feedcontributions} method calls, like
    #
    # ```ruby
    # api.feedcontributions.feedformat('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Feedcontributions} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Feedcontributions]
    #
    def feedcontributions(**options)
      Feedcontributions.new(client, @defaults.merge(**options))
    end

    # Returns a recent changes feed.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Feedrecentchanges} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.feedrecentchanges(feedformat: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Feedrecentchanges} method calls, like
    #
    # ```ruby
    # api.feedrecentchanges.feedformat('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Feedrecentchanges} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Feedrecentchanges]
    #
    def feedrecentchanges(**options)
      Feedrecentchanges.new(client, @defaults.merge(**options))
    end

    # Returns a watchlist feed.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Feedwatchlist} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.feedwatchlist(feedformat: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Feedwatchlist} method calls, like
    #
    # ```ruby
    # api.feedwatchlist.feedformat('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Feedwatchlist} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Feedwatchlist]
    #
    def feedwatchlist(**options)
      Feedwatchlist.new(client, @defaults.merge(**options))
    end

    # Revert a file to an old version.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Filerevert} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.filerevert(filename: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Filerevert} method calls, like
    #
    # ```ruby
    # api.filerevert.filename('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Filerevert} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Filerevert]
    #
    def filerevert(**options)
      Filerevert.new(client, @defaults.merge(**options))
    end

    # Get basic information about review flag configuration for this site.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Flagconfig} action.
    #

    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Flagconfig} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Flagconfig]
    #
    def flagconfig(**options)
      Flagconfig.new(client, @defaults.merge(**options))
    end

    # Globally block or unblock a user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Globalblock} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.globalblock(target: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Globalblock} method calls, like
    #
    # ```ruby
    # api.globalblock.target('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Globalblock} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Globalblock]
    #
    def globalblock(**options)
      Globalblock.new(client, @defaults.merge(**options))
    end

    # Add/remove a user to/from global groups.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Globaluserrights} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.globaluserrights(user: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Globaluserrights} method calls, like
    #
    # ```ruby
    # api.globaluserrights.user('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Globaluserrights} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Globaluserrights]
    #
    def globaluserrights(**options)
      Globaluserrights.new(client, @defaults.merge(**options))
    end

    # Access graph tag functionality.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Graph} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.graph(hash: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Graph} method calls, like
    #
    # ```ruby
    # api.graph.hash('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Graph} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Graph]
    #
    def graph(**options)
      Graph.new(client, @defaults.merge(**options))
    end

    # Display help for the specified modules.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Help} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.help(modules: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Help} method calls, like
    #
    # ```ruby
    # api.help.modules('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Help} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Help]
    #
    def help(**options)
      Help.new(client, @defaults.merge(**options))
    end

    # This module has been disabled.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Imagerotate} action.
    #

    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Imagerotate} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Imagerotate]
    #
    def imagerotate(**options)
      Imagerotate.new(client, @defaults.merge(**options))
    end

    # Import a page from another wiki, or from an XML file.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Import} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.import(summary: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Import} method calls, like
    #
    # ```ruby
    # api.import.summary('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Import} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Import]
    #
    def import(**options)
      Import.new(client, @defaults.merge(**options))
    end

    # Allows direct access to JsonConfig subsystem.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Jsonconfig} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.jsonconfig(command: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Jsonconfig} method calls, like
    #
    # ```ruby
    # api.jsonconfig.command('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Jsonconfig} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Jsonconfig]
    #
    def jsonconfig(**options)
      Jsonconfig.new(client, @defaults.merge(**options))
    end

    # Retrieve localized JSON data.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Jsondata} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.jsondata(title: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Jsondata} method calls, like
    #
    # ```ruby
    # api.jsondata.title('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Jsondata} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Jsondata]
    #
    def jsondata(**options)
      Jsondata.new(client, @defaults.merge(**options))
    end

    # Search for language names in any script.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Languagesearch} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.languagesearch(search: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Languagesearch} method calls, like
    #
    # ```ruby
    # api.languagesearch.search('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Languagesearch} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Languagesearch]
    #
    def languagesearch(**options)
      Languagesearch.new(client, @defaults.merge(**options))
    end

    # Link an account from a third-party provider to the current user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Linkaccount} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.linkaccount(requests: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Linkaccount} method calls, like
    #
    # ```ruby
    # api.linkaccount.requests('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Linkaccount} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Linkaccount]
    #
    def linkaccount(**options)
      Linkaccount.new(client, @defaults.merge(**options))
    end

    # Get the usernames and other information for students enrolled in one or more courses.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Liststudents} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.liststudents(courseids: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Liststudents} method calls, like
    #
    # ```ruby
    # api.liststudents.courseids('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Liststudents} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Liststudents]
    #
    def liststudents(**options)
      Liststudents.new(client, @defaults.merge(**options))
    end

    # Log in and get authentication cookies.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Login} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.login(name: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Login} method calls, like
    #
    # ```ruby
    # api.login.name('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Login} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Login]
    #
    def login(**options)
      Login.new(client, @defaults.merge(**options))
    end

    # Log out and clear session data.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Logout} action.
    #

    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Logout} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Logout]
    #
    def logout(**options)
      Logout.new(client, @defaults.merge(**options))
    end

    # Perform management tasks relating to change tags.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Managetags} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.managetags(operation: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Managetags} method calls, like
    #
    # ```ruby
    # api.managetags.operation('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Managetags} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Managetags]
    #
    def managetags(**options)
      Managetags.new(client, @defaults.merge(**options))
    end

    # Send a message to a list of pages.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Massmessage} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.massmessage(spamlist: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Massmessage} method calls, like
    #
    # ```ruby
    # api.massmessage.spamlist('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Massmessage} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Massmessage]
    #
    def massmessage(**options)
      Massmessage.new(client, @defaults.merge(**options))
    end

    # Merge page histories.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Mergehistory} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.mergehistory(from: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Mergehistory} method calls, like
    #
    # ```ruby
    # api.mergehistory.from('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Mergehistory} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Mergehistory]
    #
    def mergehistory(**options)
      Mergehistory.new(client, @defaults.merge(**options))
    end

    # Returns data needed for mobile views.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Mobileview} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.mobileview(page: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Mobileview} method calls, like
    #
    # ```ruby
    # api.mobileview.page('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Mobileview} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Mobileview]
    #
    def mobileview(**options)
      Mobileview.new(client, @defaults.merge(**options))
    end

    # Move a page.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Move} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.move(from: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Move} method calls, like
    #
    # ```ruby
    # api.move.from('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Move} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Move]
    #
    def move(**options)
      Move.new(client, @defaults.merge(**options))
    end

    # Validate a two-factor authentication (OATH) token.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Oathvalidate} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.oathvalidate(user: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Oathvalidate} method calls, like
    #
    # ```ruby
    # api.oathvalidate.user('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Oathvalidate} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Oathvalidate]
    #
    def oathvalidate(**options)
      Oathvalidate.new(client, @defaults.merge(**options))
    end

    # Search the wiki using the OpenSearch protocol.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Opensearch} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.opensearch(search: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Opensearch} method calls, like
    #
    # ```ruby
    # api.opensearch.search('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Opensearch} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Opensearch]
    #
    def opensearch(**options)
      Opensearch.new(client, @defaults.merge(**options))
    end

    # Change preferences of the current user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Options} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.options(reset: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Options} method calls, like
    #
    # ```ruby
    # api.options.reset('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Options} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Options]
    #
    def options(**options)
      Options.new(client, @defaults.merge(**options))
    end

    # Mark an article as reviewed or unreviewed.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Pagetriageaction} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.pagetriageaction(pageid: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Pagetriageaction} method calls, like
    #
    # ```ruby
    # api.pagetriageaction.pageid('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Pagetriageaction} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Pagetriageaction]
    #
    def pagetriageaction(**options)
      Pagetriageaction.new(client, @defaults.merge(**options))
    end

    # Get a list of page IDs for building a PageTriage queue.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Pagetriagelist} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.pagetriagelist(page_id: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Pagetriagelist} method calls, like
    #
    # ```ruby
    # api.pagetriagelist.page_id('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Pagetriagelist} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Pagetriagelist]
    #
    def pagetriagelist(**options)
      Pagetriagelist.new(client, @defaults.merge(**options))
    end

    # Get the stats for page triage.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Pagetriagestats} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.pagetriagestats(namespace: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Pagetriagestats} method calls, like
    #
    # ```ruby
    # api.pagetriagestats.namespace('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Pagetriagestats} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Pagetriagestats]
    #
    def pagetriagestats(**options)
      Pagetriagestats.new(client, @defaults.merge(**options))
    end

    # Add tags to an article.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Pagetriagetagging} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.pagetriagetagging(pageid: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Pagetriagetagging} method calls, like
    #
    # ```ruby
    # api.pagetriagetagging.pageid('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Pagetriagetagging} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Pagetriagetagging]
    #
    def pagetriagetagging(**options)
      Pagetriagetagging.new(client, @defaults.merge(**options))
    end

    # Fetch templates that are used within the PageTriage application.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Pagetriagetemplate} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.pagetriagetemplate(view: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Pagetriagetemplate} method calls, like
    #
    # ```ruby
    # api.pagetriagetemplate.view('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Pagetriagetemplate} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Pagetriagetemplate]
    #
    def pagetriagetemplate(**options)
      Pagetriagetemplate.new(client, @defaults.merge(**options))
    end

    # Obtain information about API modules.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Paraminfo} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.paraminfo(modules: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Paraminfo} method calls, like
    #
    # ```ruby
    # api.paraminfo.modules('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Paraminfo} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Paraminfo]
    #
    def paraminfo(**options)
      Paraminfo.new(client, @defaults.merge(**options))
    end

    # Parses content and returns parser output.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Parse} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.parse(title: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Parse} method calls, like
    #
    # ```ruby
    # api.parse.title('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Parse} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Parse]
    #
    def parse(**options)
      Parse.new(client, @defaults.merge(**options))
    end

    #
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::ParsoidBatch} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.parsoid_batch(batch: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::ParsoidBatch} method calls, like
    #
    # ```ruby
    # api.parsoid_batch.batch('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::ParsoidBatch} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::ParsoidBatch]
    #
    def parsoid_batch(**options)
      ParsoidBatch.new(client, @defaults.merge(**options))
    end

    # Patrol a page or revision.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Patrol} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.patrol(rcid: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Patrol} method calls, like
    #
    # ```ruby
    # api.patrol.rcid('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Patrol} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Patrol]
    #
    def patrol(**options)
      Patrol.new(client, @defaults.merge(**options))
    end

    # Change the protection level of a page.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Protect} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.protect(title: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Protect} method calls, like
    #
    # ```ruby
    # api.protect.title('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Protect} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Protect]
    #
    def protect(**options)
      Protect.new(client, @defaults.merge(**options))
    end

    # Purge the cache for the given titles.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Purge} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.purge(forcelinkupdate: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Purge} method calls, like
    #
    # ```ruby
    # api.purge.forcelinkupdate('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Purge} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Purge]
    #
    def purge(**options)
      Purge.new(client, @defaults.merge(**options))
    end

    # Fetch data from and about MediaWiki.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Query} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.query(prop: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Query} method calls, like
    #
    # ```ruby
    # api.query.prop('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Query} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Query]
    #
    def query(**options)
      Query.new(client, @defaults.merge(**options))
    end

    # Rebuild summary data of Education Program objects.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Refresheducation} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.refresheducation(ids: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Refresheducation} method calls, like
    #
    # ```ruby
    # api.refresheducation.ids('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Refresheducation} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Refresheducation]
    #
    def refresheducation(**options)
      Refresheducation.new(client, @defaults.merge(**options))
    end

    # Remove authentication data for the current user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Removeauthenticationdata} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.removeauthenticationdata(request: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Removeauthenticationdata} method calls, like
    #
    # ```ruby
    # api.removeauthenticationdata.request('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Removeauthenticationdata} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Removeauthenticationdata]
    #
    def removeauthenticationdata(**options)
      Removeauthenticationdata.new(client, @defaults.merge(**options))
    end

    # Send a password reset email to a user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Resetpassword} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.resetpassword(user: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Resetpassword} method calls, like
    #
    # ```ruby
    # api.resetpassword.user('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Resetpassword} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Resetpassword]
    #
    def resetpassword(**options)
      Resetpassword.new(client, @defaults.merge(**options))
    end

    # Review a revision by approving or de-approving it.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Review} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.review(revid: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Review} method calls, like
    #
    # ```ruby
    # api.review.revid('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Review} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Review]
    #
    def review(**options)
      Review.new(client, @defaults.merge(**options))
    end

    # Advertise or de-advertise yourself as reviewing an unreviewed page or unreviewed changes.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Reviewactivity} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.reviewactivity(previd: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Reviewactivity} method calls, like
    #
    # ```ruby
    # api.reviewactivity.previd('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Reviewactivity} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Reviewactivity]
    #
    def reviewactivity(**options)
      Reviewactivity.new(client, @defaults.merge(**options))
    end

    # Delete and undelete revisions.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Revisiondelete} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.revisiondelete(type: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Revisiondelete} method calls, like
    #
    # ```ruby
    # api.revisiondelete.type('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Revisiondelete} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Revisiondelete]
    #
    def revisiondelete(**options)
      Revisiondelete.new(client, @defaults.merge(**options))
    end

    # Undo the last edit to the page.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Rollback} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.rollback(title: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Rollback} method calls, like
    #
    # ```ruby
    # api.rollback.title('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Rollback} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Rollback]
    #
    def rollback(**options)
      Rollback.new(client, @defaults.merge(**options))
    end

    # Export an RSD (Really Simple Discovery) schema.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Rsd} action.
    #

    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Rsd} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Rsd]
    #
    def rsd(**options)
      Rsd.new(client, @defaults.merge(**options))
    end

    # Performs data validation for Kartographer extension
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::SanitizeMapdata} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.sanitize_mapdata(title: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::SanitizeMapdata} method calls, like
    #
    # ```ruby
    # api.sanitize_mapdata.title('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::SanitizeMapdata} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::SanitizeMapdata]
    #
    def sanitize_mapdata(**options)
      SanitizeMapdata.new(client, @defaults.merge(**options))
    end

    # Internal module for servicing XHR requests from the Scribunto console.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::ScribuntoConsole} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.scribunto_console(title: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::ScribuntoConsole} method calls, like
    #
    # ```ruby
    # api.scribunto_console.title('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::ScribuntoConsole} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::ScribuntoConsole]
    #
    def scribunto_console(**options)
      ScribuntoConsole.new(client, @defaults.merge(**options))
    end

    # Set a global user's status.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Setglobalaccountstatus} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.setglobalaccountstatus(user: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Setglobalaccountstatus} method calls, like
    #
    # ```ruby
    # api.setglobalaccountstatus.user('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Setglobalaccountstatus} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Setglobalaccountstatus]
    #
    def setglobalaccountstatus(**options)
      Setglobalaccountstatus.new(client, @defaults.merge(**options))
    end

    # Update the notification timestamp for watched pages.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Setnotificationtimestamp} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.setnotificationtimestamp(entirewatchlist: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Setnotificationtimestamp} method calls, like
    #
    # ```ruby
    # api.setnotificationtimestamp.entirewatchlist('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Setnotificationtimestamp} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Setnotificationtimestamp]
    #
    def setnotificationtimestamp(**options)
      Setnotificationtimestamp.new(client, @defaults.merge(**options))
    end

    # Changing the language of a page is not allowed on this wiki.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Setpagelanguage} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.setpagelanguage(title: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Setpagelanguage} method calls, like
    #
    # ```ruby
    # api.setpagelanguage.title('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Setpagelanguage} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Setpagelanguage]
    #
    def setpagelanguage(**options)
      Setpagelanguage.new(client, @defaults.merge(**options))
    end

    # Shorten a long URL into a shorter one.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Shortenurl} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.shortenurl(url: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Shortenurl} method calls, like
    #
    # ```ruby
    # api.shortenurl.url('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Shortenurl} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Shortenurl]
    #
    def shortenurl(**options)
      Shortenurl.new(client, @defaults.merge(**options))
    end

    # Get Wikimedia sites list.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Sitematrix} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.sitematrix(type: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Sitematrix} method calls, like
    #
    # ```ruby
    # api.sitematrix.type('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Sitematrix} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Sitematrix]
    #
    def sitematrix(**options)
      Sitematrix.new(client, @defaults.merge(**options))
    end

    # Validate one or more URLs against the SpamBlacklist.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Spamblacklist} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.spamblacklist(url: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Spamblacklist} method calls, like
    #
    # ```ruby
    # api.spamblacklist.url('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Spamblacklist} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Spamblacklist]
    #
    def spamblacklist(**options)
      Spamblacklist.new(client, @defaults.merge(**options))
    end

    # Configure review-protection settings for a page.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Stabilize} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.stabilize(protectlevel: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Stabilize} method calls, like
    #
    # ```ruby
    # api.stabilize.protectlevel('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Stabilize} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Stabilize]
    #
    def stabilize(**options)
      Stabilize.new(client, @defaults.merge(**options))
    end

    # Prepare an edit in shared cache.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Stashedit} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.stashedit(title: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Stashedit} method calls, like
    #
    # ```ruby
    # api.stashedit.title('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Stashedit} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Stashedit]
    #
    def stashedit(**options)
      Stashedit.new(client, @defaults.merge(**options))
    end

    # Allows admins to strike or unstrike a vote.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Strikevote} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.strikevote(option: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Strikevote} method calls, like
    #
    # ```ruby
    # api.strikevote.option('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Strikevote} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Strikevote]
    #
    def strikevote(**options)
      Strikevote.new(client, @defaults.merge(**options))
    end

    # Add or remove change tags from individual revisions or log entries.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Tag} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.tag(rcid: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Tag} method calls, like
    #
    # ```ruby
    # api.tag.rcid('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Tag} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Tag]
    #
    def tag(**options)
      Tag.new(client, @defaults.merge(**options))
    end

    # Fetch data stored by the TemplateData extension.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Templatedata} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.templatedata(titles: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Templatedata} method calls, like
    #
    # ```ruby
    # api.templatedata.titles('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Templatedata} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Templatedata]
    #
    def templatedata(**options)
      Templatedata.new(client, @defaults.merge(**options))
    end

    # Send a thank-you notification to an editor.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Thank} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.thank(rev: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Thank} method calls, like
    #
    # ```ruby
    # api.thank.rev('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Thank} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Thank]
    #
    def thank(**options)
      Thank.new(client, @defaults.merge(**options))
    end

    # Validate an article title, filename, or username against the TitleBlacklist.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Titleblacklist} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.titleblacklist(title: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Titleblacklist} method calls, like
    #
    # ```ruby
    # api.titleblacklist.title('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Titleblacklist} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Titleblacklist]
    #
    def titleblacklist(**options)
      Titleblacklist.new(client, @defaults.merge(**options))
    end

    # Get tokens for data-modifying actions.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Tokens} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.tokens(type: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Tokens} method calls, like
    #
    # ```ruby
    # api.tokens.type('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Tokens} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Tokens]
    #
    def tokens(**options)
      Tokens.new(client, @defaults.merge(**options))
    end

    # Users with the 'transcode-reset' right can reset and re-run a transcode job.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Transcodereset} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.transcodereset(title: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Transcodereset} method calls, like
    #
    # ```ruby
    # api.transcodereset.title('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Transcodereset} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Transcodereset]
    #
    def transcodereset(**options)
      Transcodereset.new(client, @defaults.merge(**options))
    end

    # Get the localization of ULS in the given language.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Ulslocalization} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.ulslocalization(language: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Ulslocalization} method calls, like
    #
    # ```ruby
    # api.ulslocalization.language('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Ulslocalization} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Ulslocalization]
    #
    def ulslocalization(**options)
      Ulslocalization.new(client, @defaults.merge(**options))
    end

    # Unblock a user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Unblock} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.unblock(id: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Unblock} method calls, like
    #
    # ```ruby
    # api.unblock.id('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Unblock} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Unblock]
    #
    def unblock(**options)
      Unblock.new(client, @defaults.merge(**options))
    end

    # Restore revisions of a deleted page.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Undelete} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.undelete(title: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Undelete} method calls, like
    #
    # ```ruby
    # api.undelete.title('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Undelete} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Undelete]
    #
    def undelete(**options)
      Undelete.new(client, @defaults.merge(**options))
    end

    # Remove a linked third-party account from the current user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Unlinkaccount} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.unlinkaccount(request: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Unlinkaccount} method calls, like
    #
    # ```ruby
    # api.unlinkaccount.request('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Unlinkaccount} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Unlinkaccount]
    #
    def unlinkaccount(**options)
      Unlinkaccount.new(client, @defaults.merge(**options))
    end

    # Upload a file, or get the status of pending uploads.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Upload} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.upload(filename: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Upload} method calls, like
    #
    # ```ruby
    # api.upload.filename('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Upload} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Upload]
    #
    def upload(**options)
      Upload.new(client, @defaults.merge(**options))
    end

    # Change a user's group membership.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Userrights} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.userrights(user: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Userrights} method calls, like
    #
    # ```ruby
    # api.userrights.user('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Userrights} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Userrights]
    #
    def userrights(**options)
      Userrights.new(client, @defaults.merge(**options))
    end

    # Validate a password against the wiki's password policies.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Validatepassword} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.validatepassword(password: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Validatepassword} method calls, like
    #
    # ```ruby
    # api.validatepassword.password('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Validatepassword} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Validatepassword]
    #
    def validatepassword(**options)
      Validatepassword.new(client, @defaults.merge(**options))
    end

    # Returns HTML5 for a page from the Parsoid service.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Visualeditor} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.visualeditor(page: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Visualeditor} method calls, like
    #
    # ```ruby
    # api.visualeditor.page('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Visualeditor} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Visualeditor]
    #
    def visualeditor(**options)
      Visualeditor.new(client, @defaults.merge(**options))
    end

    # Save an HTML5 page to MediaWiki (converted to wikitext via the Parsoid service).
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Visualeditoredit} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.visualeditoredit(paction: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Visualeditoredit} method calls, like
    #
    # ```ruby
    # api.visualeditoredit.paction('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Visualeditoredit} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Visualeditoredit]
    #
    def visualeditoredit(**options)
      Visualeditoredit.new(client, @defaults.merge(**options))
    end

    # Add or remove pages from the current user's watchlist.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Watch} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.watch(title: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Watch} method calls, like
    #
    # ```ruby
    # api.watch.title('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Watch} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Watch]
    #
    def watch(**options)
      Watch.new(client, @defaults.merge(**options))
    end

    # Returns a webapp manifest.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::WebappManifest} action.
    #

    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::WebappManifest} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::WebappManifest]
    #
    def webapp_manifest(**options)
      WebappManifest.new(client, @defaults.merge(**options))
    end

    # Give WikiLove to another user.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Wikilove} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.wikilove(title: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Wikilove} method calls, like
    #
    # ```ruby
    # api.wikilove.title('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Wikilove} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Wikilove]
    #
    def wikilove(**options)
      Wikilove.new(client, @defaults.merge(**options))
    end

    # Get configuration of the Zero extension.
    #
    # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Zeroconfig} action.
    #
    # Action parameters could be passed to this method, like
    #
    # ```ruby
    # api.zeroconfig(type: 'value')
    # ```
    # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Zeroconfig} method calls, like
    #
    # ```ruby
    # api.zeroconfig.type('value')
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Actions::Zeroconfig} class for a list of parameters and usage.
    #
    # @param [Hash] options Action options
    # @return [MediaWiktory::Wikipedia::Actions::Zeroconfig]
    #
    def zeroconfig(**options)
      Zeroconfig.new(client, @defaults.merge(**options))
    end
end

Dir[File.expand_path('../{actions,modules}/*.rb', __FILE__)].each { |f| require f }
