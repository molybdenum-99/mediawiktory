# The base API class for [Wikipedia](https://en.wikipedia.org/wiki/Main_Page).
#
# Generated from https://en.wikipedia.org/w/api.php at April 22, 2017 by MediaWiktory 0.0.3.
#
# See {MediaWiktory::Api} base class docs for generic usage examples, and this class' methods
# list and descriptions for MediaWiki features available for this particular API.
#
class MediaWiktory::Wikipedia::Api < MediaWiktory::Api
  # Check to see if an AbuseFilter matches a set of variables, editor logged AbuseFilter event.
  #
  # vars, rcid or logid is required however only one may be used.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Abusefiltercheckmatch} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.abusefiltercheckmatch(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Abusefiltercheckmatch} method calls, like
  #
  # ```ruby
  # api.abusefiltercheckmatch.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Abusefiltercheckmatch} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Abusefiltercheckmatch]
  #
  def abusefiltercheckmatch(**options)
    Abusefiltercheckmatch.new(**options)
  end
  # Check syntax of an AbuseFilter filter.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Abusefilterchecksyntax} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.abusefilterchecksyntax(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Abusefilterchecksyntax} method calls, like
  #
  # ```ruby
  # api.abusefilterchecksyntax.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Abusefilterchecksyntax} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Abusefilterchecksyntax]
  #
  def abusefilterchecksyntax(**options)
    Abusefilterchecksyntax.new(**options)
  end
  # Evaluates an AbuseFilter expression.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Abusefilterevalexpression} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.abusefilterevalexpression(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Abusefilterevalexpression} method calls, like
  #
  # ```ruby
  # api.abusefilterevalexpression.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Abusefilterevalexpression} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Abusefilterevalexpression]
  #
  def abusefilterevalexpression(**options)
    Abusefilterevalexpression.new(**options)
  end
  # Unblocks a user from receiving autopromotions due to an abusefilter consequence.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Abusefilterunblockautopromote} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.abusefilterunblockautopromote(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Abusefilterunblockautopromote} method calls, like
  #
  # ```ruby
  # api.abusefilterunblockautopromote.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Abusefilterunblockautopromote} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Abusefilterunblockautopromote]
  #
  def abusefilterunblockautopromote(**options)
    Abusefilterunblockautopromote.new(**options)
  end
  # Add multiple students to a course.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Addstudents} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.addstudents(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Addstudents} method calls, like
  #
  # ```ruby
  # api.addstudents.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Addstudents} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Addstudents]
  #
  def addstudents(**options)
    Addstudents.new(**options)
  end
  # Check a username against AntiSpoof's normalisation checks.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Antispoof} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.antispoof(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Antispoof} method calls, like
  #
  # ```ruby
  # api.antispoof.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Antispoof} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Antispoof]
  #
  def antispoof(**options)
    Antispoof.new(**options)
  end
  # Block a user.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Block} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.block(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Block} method calls, like
  #
  # ```ruby
  # api.block.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Block} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Block]
  #
  def block(**options)
    Block.new(**options)
  end
  # Receive a bounce email and process it to handle the failing recipient.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Bouncehandler} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.bouncehandler(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Bouncehandler} method calls, like
  #
  # ```ruby
  # api.bouncehandler.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Bouncehandler} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Bouncehandler]
  #
  def bouncehandler(**options)
    Bouncehandler.new(**options)
  end
  # Internal module for the CategoryTree extension.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Categorytree} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.categorytree(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Categorytree} method calls, like
  #
  # ```ruby
  # api.categorytree.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Categorytree} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Categorytree]
  #
  def categorytree(**options)
    Categorytree.new(**options)
  end
  # Fetch a centralauthtoken for making an authenticated request to an attached wiki.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Centralauthtoken} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.centralauthtoken(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Centralauthtoken} method calls, like
  #
  # ```ruby
  # api.centralauthtoken.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Centralauthtoken} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Centralauthtoken]
  #
  def centralauthtoken(**options)
    Centralauthtoken.new(**options)
  end
  # Get data needed to choose a banner for a given project and language
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Centralnoticechoicedata} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.centralnoticechoicedata(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Centralnoticechoicedata} method calls, like
  #
  # ```ruby
  # api.centralnoticechoicedata.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Centralnoticechoicedata} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Centralnoticechoicedata]
  #
  def centralnoticechoicedata(**options)
    Centralnoticechoicedata.new(**options)
  end
  # Get all configuration settings for a campaign.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Centralnoticequerycampaign} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.centralnoticequerycampaign(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Centralnoticequerycampaign} method calls, like
  #
  # ```ruby
  # api.centralnoticequerycampaign.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Centralnoticequerycampaign} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Centralnoticequerycampaign]
  #
  def centralnoticequerycampaign(**options)
    Centralnoticequerycampaign.new(**options)
  end
  # Change authentication data for the current user.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Changeauthenticationdata} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.changeauthenticationdata(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Changeauthenticationdata} method calls, like
  #
  # ```ruby
  # api.changeauthenticationdata.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Changeauthenticationdata} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Changeauthenticationdata]
  #
  def changeauthenticationdata(**options)
    Changeauthenticationdata.new(**options)
  end
  # Check the validity of a token from action=query&meta=tokens.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Checktoken} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.checktoken(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Checktoken} method calls, like
  #
  # ```ruby
  # api.checktoken.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Checktoken} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Checktoken]
  #
  def checktoken(**options)
    Checktoken.new(**options)
  end
  # Dump of CirrusSearch configuration.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Cirrus-config-dump} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.cirrus-config-dump(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Cirrus-config-dump} method calls, like
  #
  # ```ruby
  # api.cirrus-config-dump.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Cirrus-config-dump} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Cirrus-config-dump]
  #
  def cirrus-config-dump(**options)
    Cirrus-config-dump.new(**options)
  end
  # Dump of CirrusSearch mapping for this wiki.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Cirrus-mapping-dump} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.cirrus-mapping-dump(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Cirrus-mapping-dump} method calls, like
  #
  # ```ruby
  # api.cirrus-mapping-dump.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Cirrus-mapping-dump} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Cirrus-mapping-dump]
  #
  def cirrus-mapping-dump(**options)
    Cirrus-mapping-dump.new(**options)
  end
  # Dump of CirrusSearch settings for this wiki.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Cirrus-settings-dump} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.cirrus-settings-dump(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Cirrus-settings-dump} method calls, like
  #
  # ```ruby
  # api.cirrus-settings-dump.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Cirrus-settings-dump} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Cirrus-settings-dump]
  #
  def cirrus-settings-dump(**options)
    Cirrus-settings-dump.new(**options)
  end
  # Clears the hasmsg flag for the current user.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Clearhasmsg} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.clearhasmsg(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Clearhasmsg} method calls, like
  #
  # ```ruby
  # api.clearhasmsg.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Clearhasmsg} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Clearhasmsg]
  #
  def clearhasmsg(**options)
    Clearhasmsg.new(**options)
  end
  # Log in to the wiki using the interactive flow.
  #
  # The general procedure to use this module is:
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Clientlogin} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.clientlogin(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Clientlogin} method calls, like
  #
  # ```ruby
  # api.clientlogin.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Clientlogin} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Clientlogin]
  #
  def clientlogin(**options)
    Clientlogin.new(**options)
  end
  # Get the difference between 2 pages.
  #
  # A revision number, a page title, or a page ID for both "from" and "to" must be passed.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Compare} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.compare(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Compare} method calls, like
  #
  # ```ruby
  # api.compare.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Compare} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Compare]
  #
  def compare(**options)
    Compare.new(**options)
  end
  # Create a new user account.
  #
  # The general procedure to use this module is:
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Createaccount} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.createaccount(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Createaccount} method calls, like
  #
  # ```ruby
  # api.createaccount.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Createaccount} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Createaccount]
  #
  def createaccount(**options)
    Createaccount.new(**options)
  end
  # Used by browsers to report violations of the Content Security Policy. This module should never be used, except when used automatically by a CSP compliant web browser.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Cspreport} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.cspreport(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Cspreport} method calls, like
  #
  # ```ruby
  # api.cspreport.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Cspreport} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Cspreport]
  #
  def cspreport(**options)
    Cspreport.new(**options)
  end
  # Delete a page.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Delete} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.delete(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Delete} method calls, like
  #
  # ```ruby
  # api.delete.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Delete} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Delete]
  #
  def delete(**options)
    Delete.new(**options)
  end
  # Delete Education Program objects.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Deleteeducation} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.deleteeducation(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Deleteeducation} method calls, like
  #
  # ```ruby
  # api.deleteeducation.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Deleteeducation} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Deleteeducation]
  #
  def deleteeducation(**options)
    Deleteeducation.new(**options)
  end
  # Delete a global user.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Deleteglobalaccount} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.deleteglobalaccount(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Deleteglobalaccount} method calls, like
  #
  # ```ruby
  # api.deleteglobalaccount.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Deleteglobalaccount} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Deleteglobalaccount]
  #
  def deleteglobalaccount(**options)
    Deleteglobalaccount.new(**options)
  end
  # Mark notifications as read for the current user.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Echomarkread} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.echomarkread(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Echomarkread} method calls, like
  #
  # ```ruby
  # api.echomarkread.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Echomarkread} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Echomarkread]
  #
  def echomarkread(**options)
    Echomarkread.new(**options)
  end
  # Mark notifications as seen for the current user.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Echomarkseen} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.echomarkseen(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Echomarkseen} method calls, like
  #
  # ```ruby
  # api.echomarkseen.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Echomarkseen} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Echomarkseen]
  #
  def echomarkseen(**options)
    Echomarkseen.new(**options)
  end
  # Create and edit pages.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Edit} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.edit(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Edit} method calls, like
  #
  # ```ruby
  # api.edit.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Edit} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Edit]
  #
  def edit(**options)
    Edit.new(**options)
  end
  # Edit a mass message delivery list.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Editmassmessagelist} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.editmassmessagelist(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Editmassmessagelist} method calls, like
  #
  # ```ruby
  # api.editmassmessagelist.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Editmassmessagelist} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Editmassmessagelist]
  #
  def editmassmessagelist(**options)
    Editmassmessagelist.new(**options)
  end
  # Email a user.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Emailuser} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.emailuser(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Emailuser} method calls, like
  #
  # ```ruby
  # api.emailuser.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Emailuser} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Emailuser]
  #
  def emailuser(**options)
    Emailuser.new(**options)
  end
  # Associate or disassociate a user as instructor or volunteer for a course.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Enlist} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.enlist(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Enlist} method calls, like
  #
  # ```ruby
  # api.enlist.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Enlist} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Enlist]
  #
  def enlist(**options)
    Enlist.new(**options)
  end
  # Expands all templates within wikitext.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Expandtemplates} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.expandtemplates(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Expandtemplates} method calls, like
  #
  # ```ruby
  # api.expandtemplates.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Expandtemplates} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Expandtemplates]
  #
  def expandtemplates(**options)
    Expandtemplates.new(**options)
  end
  # Get a new FancyCaptcha.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Fancycaptchareload} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.fancycaptchareload(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Fancycaptchareload} method calls, like
  #
  # ```ruby
  # api.fancycaptchareload.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Fancycaptchareload} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Fancycaptchareload]
  #
  def fancycaptchareload(**options)
    Fancycaptchareload.new(**options)
  end
  # Returns a featured content feed.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Featuredfeed} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.featuredfeed(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Featuredfeed} method calls, like
  #
  # ```ruby
  # api.featuredfeed.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Featuredfeed} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Featuredfeed]
  #
  def featuredfeed(**options)
    Featuredfeed.new(**options)
  end
  # Returns a user contributions feed.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Feedcontributions} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.feedcontributions(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Feedcontributions} method calls, like
  #
  # ```ruby
  # api.feedcontributions.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Feedcontributions} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Feedcontributions]
  #
  def feedcontributions(**options)
    Feedcontributions.new(**options)
  end
  # Returns a recent changes feed.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Feedrecentchanges} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.feedrecentchanges(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Feedrecentchanges} method calls, like
  #
  # ```ruby
  # api.feedrecentchanges.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Feedrecentchanges} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Feedrecentchanges]
  #
  def feedrecentchanges(**options)
    Feedrecentchanges.new(**options)
  end
  # Returns a watchlist feed.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Feedwatchlist} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.feedwatchlist(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Feedwatchlist} method calls, like
  #
  # ```ruby
  # api.feedwatchlist.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Feedwatchlist} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Feedwatchlist]
  #
  def feedwatchlist(**options)
    Feedwatchlist.new(**options)
  end
  # Revert a file to an old version.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Filerevert} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.filerevert(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Filerevert} method calls, like
  #
  # ```ruby
  # api.filerevert.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Filerevert} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Filerevert]
  #
  def filerevert(**options)
    Filerevert.new(**options)
  end
  # Get basic information about review flag configuration for this site.
  #
  # The following parameters are returned for each tag:
  #
  # Flagged revisions have an assigned level for each tag. The highest tier that all the tags meet is the review tier of the entire revision.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Flagconfig} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.flagconfig(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Flagconfig} method calls, like
  #
  # ```ruby
  # api.flagconfig.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Flagconfig} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Flagconfig]
  #
  def flagconfig(**options)
    Flagconfig.new(**options)
  end
  # Globally block or unblock a user.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Globalblock} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.globalblock(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Globalblock} method calls, like
  #
  # ```ruby
  # api.globalblock.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Globalblock} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Globalblock]
  #
  def globalblock(**options)
    Globalblock.new(**options)
  end
  # Add/remove a user to/from global groups.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Globaluserrights} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.globaluserrights(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Globaluserrights} method calls, like
  #
  # ```ruby
  # api.globaluserrights.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Globaluserrights} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Globaluserrights]
  #
  def globaluserrights(**options)
    Globaluserrights.new(**options)
  end
  # Access graph tag functionality.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Graph} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.graph(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Graph} method calls, like
  #
  # ```ruby
  # api.graph.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Graph} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Graph]
  #
  def graph(**options)
    Graph.new(**options)
  end
  # Display help for the specified modules.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Help} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.help(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Help} method calls, like
  #
  # ```ruby
  # api.help.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Help} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Help]
  #
  def help(**options)
    Help.new(**options)
  end
  # This module has been disabled.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Imagerotate} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.imagerotate(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Imagerotate} method calls, like
  #
  # ```ruby
  # api.imagerotate.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Imagerotate} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Imagerotate]
  #
  def imagerotate(**options)
    Imagerotate.new(**options)
  end
  # Import a page from another wiki, or from an XML file.
  #
  # Note that the HTTP POST must be done as a file upload (i.e. using multipart/form-data) when sending a file for the xml parameter.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Import} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.import(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Import} method calls, like
  #
  # ```ruby
  # api.import.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Import} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Import]
  #
  def import(**options)
    Import.new(**options)
  end
  # Allows direct access to JsonConfig subsystem.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Jsonconfig} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.jsonconfig(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Jsonconfig} method calls, like
  #
  # ```ruby
  # api.jsonconfig.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Jsonconfig} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Jsonconfig]
  #
  def jsonconfig(**options)
    Jsonconfig.new(**options)
  end
  # Retrieve localized JSON data.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Jsondata} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.jsondata(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Jsondata} method calls, like
  #
  # ```ruby
  # api.jsondata.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Jsondata} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Jsondata]
  #
  def jsondata(**options)
    Jsondata.new(**options)
  end
  # Search for language names in any script.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Languagesearch} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.languagesearch(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Languagesearch} method calls, like
  #
  # ```ruby
  # api.languagesearch.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Languagesearch} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Languagesearch]
  #
  def languagesearch(**options)
    Languagesearch.new(**options)
  end
  # Link an account from a third-party provider to the current user.
  #
  # The general procedure to use this module is:
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Linkaccount} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.linkaccount(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Linkaccount} method calls, like
  #
  # ```ruby
  # api.linkaccount.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Linkaccount} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Linkaccount]
  #
  def linkaccount(**options)
    Linkaccount.new(**options)
  end
  # Get the usernames and other information for students enrolled in one or more courses.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Liststudents} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.liststudents(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Liststudents} method calls, like
  #
  # ```ruby
  # api.liststudents.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Liststudents} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Liststudents]
  #
  def liststudents(**options)
    Liststudents.new(**options)
  end
  # Log in and get authentication cookies.
  #
  # This action should only be used in combination with Special:BotPasswords; use for main-account login is deprecated and may fail without warning. To safely log in to the main account, use action=clientlogin.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Login} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.login(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Login} method calls, like
  #
  # ```ruby
  # api.login.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Login} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Login]
  #
  def login(**options)
    Login.new(**options)
  end
  # Log out and clear session data.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Logout} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.logout(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Logout} method calls, like
  #
  # ```ruby
  # api.logout.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Logout} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Logout]
  #
  def logout(**options)
    Logout.new(**options)
  end
  # Perform management tasks relating to change tags.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Managetags} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.managetags(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Managetags} method calls, like
  #
  # ```ruby
  # api.managetags.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Managetags} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Managetags]
  #
  def managetags(**options)
    Managetags.new(**options)
  end
  # Send a message to a list of pages.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Massmessage} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.massmessage(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Massmessage} method calls, like
  #
  # ```ruby
  # api.massmessage.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Massmessage} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Massmessage]
  #
  def massmessage(**options)
    Massmessage.new(**options)
  end
  # Merge page histories.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Mergehistory} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.mergehistory(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Mergehistory} method calls, like
  #
  # ```ruby
  # api.mergehistory.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Mergehistory} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Mergehistory]
  #
  def mergehistory(**options)
    Mergehistory.new(**options)
  end
  # Returns data needed for mobile views.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Mobileview} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.mobileview(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Mobileview} method calls, like
  #
  # ```ruby
  # api.mobileview.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Mobileview} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Mobileview]
  #
  def mobileview(**options)
    Mobileview.new(**options)
  end
  # Move a page.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Move} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.move(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Move} method calls, like
  #
  # ```ruby
  # api.move.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Move} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Move]
  #
  def move(**options)
    Move.new(**options)
  end
  # Validate a two-factor authentication (OATH) token.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Oathvalidate} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.oathvalidate(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Oathvalidate} method calls, like
  #
  # ```ruby
  # api.oathvalidate.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Oathvalidate} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Oathvalidate]
  #
  def oathvalidate(**options)
    Oathvalidate.new(**options)
  end
  # Search the wiki using the OpenSearch protocol.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Opensearch} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.opensearch(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Opensearch} method calls, like
  #
  # ```ruby
  # api.opensearch.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Opensearch} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Opensearch]
  #
  def opensearch(**options)
    Opensearch.new(**options)
  end
  # Change preferences of the current user.
  #
  # Only options which are registered in core or in one of installed extensions, or options with keys prefixed with userjs- (intended to be used by user scripts), can be set.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Options} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.options(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Options} method calls, like
  #
  # ```ruby
  # api.options.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Options} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Options]
  #
  def options(**options)
    Options.new(**options)
  end
  # Mark an article as reviewed or unreviewed.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Pagetriageaction} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.pagetriageaction(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Pagetriageaction} method calls, like
  #
  # ```ruby
  # api.pagetriageaction.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Pagetriageaction} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Pagetriageaction]
  #
  def pagetriageaction(**options)
    Pagetriageaction.new(**options)
  end
  # Get a list of page IDs for building a PageTriage queue.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Pagetriagelist} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.pagetriagelist(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Pagetriagelist} method calls, like
  #
  # ```ruby
  # api.pagetriagelist.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Pagetriagelist} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Pagetriagelist]
  #
  def pagetriagelist(**options)
    Pagetriagelist.new(**options)
  end
  # Get the stats for page triage.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Pagetriagestats} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.pagetriagestats(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Pagetriagestats} method calls, like
  #
  # ```ruby
  # api.pagetriagestats.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Pagetriagestats} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Pagetriagestats]
  #
  def pagetriagestats(**options)
    Pagetriagestats.new(**options)
  end
  # Add tags to an article.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Pagetriagetagging} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.pagetriagetagging(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Pagetriagetagging} method calls, like
  #
  # ```ruby
  # api.pagetriagetagging.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Pagetriagetagging} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Pagetriagetagging]
  #
  def pagetriagetagging(**options)
    Pagetriagetagging.new(**options)
  end
  # Fetch templates that are used within the PageTriage application.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Pagetriagetemplate} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.pagetriagetemplate(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Pagetriagetemplate} method calls, like
  #
  # ```ruby
  # api.pagetriagetemplate.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Pagetriagetemplate} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Pagetriagetemplate]
  #
  def pagetriagetemplate(**options)
    Pagetriagetemplate.new(**options)
  end
  # Obtain information about API modules.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Paraminfo} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.paraminfo(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Paraminfo} method calls, like
  #
  # ```ruby
  # api.paraminfo.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Paraminfo} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Paraminfo]
  #
  def paraminfo(**options)
    Paraminfo.new(**options)
  end
  # Parses content and returns parser output.
  #
  # See the various prop-modules of action=query to get information from the current version of a page.
  #
  # There are several ways to specify the text to parse:
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Parse} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.parse(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Parse} method calls, like
  #
  # ```ruby
  # api.parse.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Parse} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Parse]
  #
  def parse(**options)
    Parse.new(**options)
  end
  # 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Parsoid-batch} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.parsoid-batch(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Parsoid-batch} method calls, like
  #
  # ```ruby
  # api.parsoid-batch.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Parsoid-batch} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Parsoid-batch]
  #
  def parsoid-batch(**options)
    Parsoid-batch.new(**options)
  end
  # Patrol a page or revision.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Patrol} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.patrol(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Patrol} method calls, like
  #
  # ```ruby
  # api.patrol.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Patrol} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Patrol]
  #
  def patrol(**options)
    Patrol.new(**options)
  end
  # Change the protection level of a page.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Protect} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.protect(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Protect} method calls, like
  #
  # ```ruby
  # api.protect.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Protect} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Protect]
  #
  def protect(**options)
    Protect.new(**options)
  end
  # Purge the cache for the given titles.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Purge} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.purge(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Purge} method calls, like
  #
  # ```ruby
  # api.purge.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Purge} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Purge]
  #
  def purge(**options)
    Purge.new(**options)
  end
  # Fetch data from and about MediaWiki.
  #
  # All data modifications will first have to use query to acquire a token to prevent abuse from malicious sites.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Query} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.query(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Query} method calls, like
  #
  # ```ruby
  # api.query.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Query} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Query]
  #
  def query(**options)
    Query.new(**options)
  end
  # Rebuild summary data of Education Program objects.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Refresheducation} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.refresheducation(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Refresheducation} method calls, like
  #
  # ```ruby
  # api.refresheducation.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Refresheducation} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Refresheducation]
  #
  def refresheducation(**options)
    Refresheducation.new(**options)
  end
  # Remove authentication data for the current user.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Removeauthenticationdata} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.removeauthenticationdata(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Removeauthenticationdata} method calls, like
  #
  # ```ruby
  # api.removeauthenticationdata.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Removeauthenticationdata} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Removeauthenticationdata]
  #
  def removeauthenticationdata(**options)
    Removeauthenticationdata.new(**options)
  end
  # Send a password reset email to a user.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Resetpassword} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.resetpassword(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Resetpassword} method calls, like
  #
  # ```ruby
  # api.resetpassword.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Resetpassword} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Resetpassword]
  #
  def resetpassword(**options)
    Resetpassword.new(**options)
  end
  # Review a revision by approving or de-approving it.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Review} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.review(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Review} method calls, like
  #
  # ```ruby
  # api.review.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Review} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Review]
  #
  def review(**options)
    Review.new(**options)
  end
  # Advertise or de-advertise yourself as reviewing an unreviewed page or unreviewed changes.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Reviewactivity} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.reviewactivity(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Reviewactivity} method calls, like
  #
  # ```ruby
  # api.reviewactivity.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Reviewactivity} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Reviewactivity]
  #
  def reviewactivity(**options)
    Reviewactivity.new(**options)
  end
  # Delete and undelete revisions.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Revisiondelete} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.revisiondelete(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Revisiondelete} method calls, like
  #
  # ```ruby
  # api.revisiondelete.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Revisiondelete} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Revisiondelete]
  #
  def revisiondelete(**options)
    Revisiondelete.new(**options)
  end
  # Undo the last edit to the page.
  #
  # If the last user who edited the page made multiple edits in a row, they will all be rolled back.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Rollback} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.rollback(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Rollback} method calls, like
  #
  # ```ruby
  # api.rollback.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Rollback} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Rollback]
  #
  def rollback(**options)
    Rollback.new(**options)
  end
  # Export an RSD (Really Simple Discovery) schema.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Rsd} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.rsd(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Rsd} method calls, like
  #
  # ```ruby
  # api.rsd.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Rsd} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Rsd]
  #
  def rsd(**options)
    Rsd.new(**options)
  end
  # Performs data validation for Kartographer extension
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Sanitize-mapdata} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.sanitize-mapdata(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Sanitize-mapdata} method calls, like
  #
  # ```ruby
  # api.sanitize-mapdata.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Sanitize-mapdata} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Sanitize-mapdata]
  #
  def sanitize-mapdata(**options)
    Sanitize-mapdata.new(**options)
  end
  # Internal module for servicing XHR requests from the Scribunto console.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Scribunto-console} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.scribunto-console(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Scribunto-console} method calls, like
  #
  # ```ruby
  # api.scribunto-console.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Scribunto-console} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Scribunto-console]
  #
  def scribunto-console(**options)
    Scribunto-console.new(**options)
  end
  # Set a global user's status.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Setglobalaccountstatus} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.setglobalaccountstatus(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Setglobalaccountstatus} method calls, like
  #
  # ```ruby
  # api.setglobalaccountstatus.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Setglobalaccountstatus} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Setglobalaccountstatus]
  #
  def setglobalaccountstatus(**options)
    Setglobalaccountstatus.new(**options)
  end
  # Update the notification timestamp for watched pages.
  #
  # This affects the highlighting of changed pages in the watchlist and history, and the sending of email when the "Email me when a page or a file on my watchlist is changed" preference is enabled.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Setnotificationtimestamp} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.setnotificationtimestamp(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Setnotificationtimestamp} method calls, like
  #
  # ```ruby
  # api.setnotificationtimestamp.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Setnotificationtimestamp} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Setnotificationtimestamp]
  #
  def setnotificationtimestamp(**options)
    Setnotificationtimestamp.new(**options)
  end
  # Changing the language of a page is not allowed on this wiki.
  #
  # Enable $wgPageLanguageUseDB to use this action.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Setpagelanguage} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.setpagelanguage(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Setpagelanguage} method calls, like
  #
  # ```ruby
  # api.setpagelanguage.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Setpagelanguage} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Setpagelanguage]
  #
  def setpagelanguage(**options)
    Setpagelanguage.new(**options)
  end
  # Shorten a long URL into a shorter one.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Shortenurl} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.shortenurl(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Shortenurl} method calls, like
  #
  # ```ruby
  # api.shortenurl.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Shortenurl} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Shortenurl]
  #
  def shortenurl(**options)
    Shortenurl.new(**options)
  end
  # Get Wikimedia sites list.
  #
  # The code (technically dbname/wikiid) is either the language code + project code for content projects or the subdomain + main domain for all the others.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Sitematrix} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.sitematrix(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Sitematrix} method calls, like
  #
  # ```ruby
  # api.sitematrix.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Sitematrix} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Sitematrix]
  #
  def sitematrix(**options)
    Sitematrix.new(**options)
  end
  # Validate one or more URLs against the SpamBlacklist.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Spamblacklist} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.spamblacklist(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Spamblacklist} method calls, like
  #
  # ```ruby
  # api.spamblacklist.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Spamblacklist} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Spamblacklist]
  #
  def spamblacklist(**options)
    Spamblacklist.new(**options)
  end
  # Configure review-protection settings for a page.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Stabilize} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.stabilize(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Stabilize} method calls, like
  #
  # ```ruby
  # api.stabilize.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Stabilize} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Stabilize]
  #
  def stabilize(**options)
    Stabilize.new(**options)
  end
  # Prepare an edit in shared cache.
  #
  # This is intended to be used via AJAX from the edit form to improve the performance of the page save.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Stashedit} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.stashedit(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Stashedit} method calls, like
  #
  # ```ruby
  # api.stashedit.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Stashedit} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Stashedit]
  #
  def stashedit(**options)
    Stashedit.new(**options)
  end
  # Allows admins to strike or unstrike a vote.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Strikevote} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.strikevote(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Strikevote} method calls, like
  #
  # ```ruby
  # api.strikevote.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Strikevote} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Strikevote]
  #
  def strikevote(**options)
    Strikevote.new(**options)
  end
  # Add or remove change tags from individual revisions or log entries.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Tag} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.tag(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Tag} method calls, like
  #
  # ```ruby
  # api.tag.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Tag} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Tag]
  #
  def tag(**options)
    Tag.new(**options)
  end
  # Fetch data stored by the TemplateData extension.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Templatedata} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.templatedata(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Templatedata} method calls, like
  #
  # ```ruby
  # api.templatedata.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Templatedata} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Templatedata]
  #
  def templatedata(**options)
    Templatedata.new(**options)
  end
  # Send a thank-you notification to an editor.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Thank} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.thank(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Thank} method calls, like
  #
  # ```ruby
  # api.thank.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Thank} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Thank]
  #
  def thank(**options)
    Thank.new(**options)
  end
  # Validate an article title, filename, or username against the TitleBlacklist.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Titleblacklist} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.titleblacklist(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Titleblacklist} method calls, like
  #
  # ```ruby
  # api.titleblacklist.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Titleblacklist} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Titleblacklist]
  #
  def titleblacklist(**options)
    Titleblacklist.new(**options)
  end
  # Get tokens for data-modifying actions.
  #
  # This module is deprecated in favor of action=query&meta=tokens.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Tokens} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.tokens(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Tokens} method calls, like
  #
  # ```ruby
  # api.tokens.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Tokens} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Tokens]
  #
  def tokens(**options)
    Tokens.new(**options)
  end
  # Users with the 'transcode-reset' right can reset and re-run a transcode job.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Transcodereset} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.transcodereset(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Transcodereset} method calls, like
  #
  # ```ruby
  # api.transcodereset.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Transcodereset} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Transcodereset]
  #
  def transcodereset(**options)
    Transcodereset.new(**options)
  end
  # Get the localization of ULS in the given language.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Ulslocalization} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.ulslocalization(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Ulslocalization} method calls, like
  #
  # ```ruby
  # api.ulslocalization.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Ulslocalization} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Ulslocalization]
  #
  def ulslocalization(**options)
    Ulslocalization.new(**options)
  end
  # Unblock a user.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Unblock} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.unblock(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Unblock} method calls, like
  #
  # ```ruby
  # api.unblock.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Unblock} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Unblock]
  #
  def unblock(**options)
    Unblock.new(**options)
  end
  # Restore revisions of a deleted page.
  #
  # A list of deleted revisions (including timestamps) can be retrieved through prop=deletedrevisions, and a list of deleted file IDs can be retrieved through list=filearchive.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Undelete} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.undelete(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Undelete} method calls, like
  #
  # ```ruby
  # api.undelete.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Undelete} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Undelete]
  #
  def undelete(**options)
    Undelete.new(**options)
  end
  # Remove a linked third-party account from the current user.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Unlinkaccount} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.unlinkaccount(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Unlinkaccount} method calls, like
  #
  # ```ruby
  # api.unlinkaccount.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Unlinkaccount} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Unlinkaccount]
  #
  def unlinkaccount(**options)
    Unlinkaccount.new(**options)
  end
  # Upload a file, or get the status of pending uploads.
  #
  # Several methods are available:
  #
  # Note that the HTTP POST must be done as a file upload (i.e. using multipart/form-data) when sending the file.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Upload} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.upload(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Upload} method calls, like
  #
  # ```ruby
  # api.upload.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Upload} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Upload]
  #
  def upload(**options)
    Upload.new(**options)
  end
  # Change a user's group membership.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Userrights} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.userrights(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Userrights} method calls, like
  #
  # ```ruby
  # api.userrights.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Userrights} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Userrights]
  #
  def userrights(**options)
    Userrights.new(**options)
  end
  # Validate a password against the wiki's password policies.
  #
  # Validity is reported as Good if the password is acceptable, Change if the password may be used for login but must be changed, or Invalid if the password is not usable.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Validatepassword} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.validatepassword(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Validatepassword} method calls, like
  #
  # ```ruby
  # api.validatepassword.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Validatepassword} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Validatepassword]
  #
  def validatepassword(**options)
    Validatepassword.new(**options)
  end
  # Returns HTML5 for a page from the Parsoid service.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Visualeditor} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.visualeditor(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Visualeditor} method calls, like
  #
  # ```ruby
  # api.visualeditor.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Visualeditor} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Visualeditor]
  #
  def visualeditor(**options)
    Visualeditor.new(**options)
  end
  # Save an HTML5 page to MediaWiki (converted to wikitext via the Parsoid service).
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Visualeditoredit} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.visualeditoredit(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Visualeditoredit} method calls, like
  #
  # ```ruby
  # api.visualeditoredit.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Visualeditoredit} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Visualeditoredit]
  #
  def visualeditoredit(**options)
    Visualeditoredit.new(**options)
  end
  # Add or remove pages from the current user's watchlist.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Watch} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.watch(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Watch} method calls, like
  #
  # ```ruby
  # api.watch.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Watch} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Watch]
  #
  def watch(**options)
    Watch.new(**options)
  end
  # Returns a webapp manifest.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Webapp-manifest} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.webapp-manifest(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Webapp-manifest} method calls, like
  #
  # ```ruby
  # api.webapp-manifest.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Webapp-manifest} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Webapp-manifest]
  #
  def webapp-manifest(**options)
    Webapp-manifest.new(**options)
  end
  # Give WikiLove to another user.
  #
  # WikiLove is a positive message posted to a user's talk page through a convenient interface with preset or locally defined templates. This action adds the specified wikitext to a certain talk page. For statistical purposes, the type and other data are logged.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Wikilove} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.wikilove(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Wikilove} method calls, like
  #
  # ```ruby
  # api.wikilove.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Wikilove} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Wikilove]
  #
  def wikilove(**options)
    Wikilove.new(**options)
  end
  # Get configuration of the Zero extension.
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Zeroconfig} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.zeroconfig(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Zeroconfig} method calls, like
  #
  # ```ruby
  # api.zeroconfig.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Zeroconfig} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Zeroconfig]
  #
  def zeroconfig(**options)
    Zeroconfig.new(**options)
  end

end