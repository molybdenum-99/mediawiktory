# The base API class for [Wikipedia](https://en.wikipedia.org/wiki/Main_Page).
#
# Generated from https://en.wikipedia.org/w/api.php at April 23, 2017 by MediaWiktory 0.0.3.
#
# See {MediaWiktory::Api} base class docs for generic usage examples, and this class' methods
# list and descriptions for MediaWiki features available for this particular API.
#
class MediaWiktory::Wikipedia::Api < MediaWiktory::Api
  # Check to see if an AbuseFilter matches a set of variables, editor logged AbuseFilter event. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Abusefiltercheckmatch} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.abusefiltercheckmatch(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Abusefiltercheckmatch} method calls, like
  #
  # ```ruby
  # api.abusefiltercheckmatch.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Abusefiltercheckmatch} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Abusefiltercheckmatch]
  #
  def abusefiltercheckmatch(**options)
    Actions::Abusefiltercheckmatch.new(**options)
  end
  # Check syntax of an AbuseFilter filter. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Abusefilterchecksyntax} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.abusefilterchecksyntax(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Abusefilterchecksyntax} method calls, like
  #
  # ```ruby
  # api.abusefilterchecksyntax.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Abusefilterchecksyntax} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Abusefilterchecksyntax]
  #
  def abusefilterchecksyntax(**options)
    Actions::Abusefilterchecksyntax.new(**options)
  end
  # Evaluates an AbuseFilter expression. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Abusefilterevalexpression} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.abusefilterevalexpression(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Abusefilterevalexpression} method calls, like
  #
  # ```ruby
  # api.abusefilterevalexpression.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Abusefilterevalexpression} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Abusefilterevalexpression]
  #
  def abusefilterevalexpression(**options)
    Actions::Abusefilterevalexpression.new(**options)
  end
  # Unblocks a user from receiving autopromotions due to an abusefilter consequence. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Abusefilterunblockautopromote} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.abusefilterunblockautopromote(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Abusefilterunblockautopromote} method calls, like
  #
  # ```ruby
  # api.abusefilterunblockautopromote.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Abusefilterunblockautopromote} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Abusefilterunblockautopromote]
  #
  def abusefilterunblockautopromote(**options)
    Actions::Abusefilterunblockautopromote.new(**options)
  end
  # Add multiple students to a course. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Addstudents} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.addstudents(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Addstudents} method calls, like
  #
  # ```ruby
  # api.addstudents.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Addstudents} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Addstudents]
  #
  def addstudents(**options)
    Actions::Addstudents.new(**options)
  end
  # Check a username against AntiSpoof's normalisation checks. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Antispoof} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.antispoof(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Antispoof} method calls, like
  #
  # ```ruby
  # api.antispoof.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Antispoof} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Antispoof]
  #
  def antispoof(**options)
    Actions::Antispoof.new(**options)
  end
  # Block a user. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Block} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.block(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Block} method calls, like
  #
  # ```ruby
  # api.block.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Block} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Block]
  #
  def block(**options)
    Actions::Block.new(**options)
  end
  # Receive a bounce email and process it to handle the failing recipient. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Bouncehandler} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.bouncehandler(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Bouncehandler} method calls, like
  #
  # ```ruby
  # api.bouncehandler.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Bouncehandler} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Bouncehandler]
  #
  def bouncehandler(**options)
    Actions::Bouncehandler.new(**options)
  end
  # Internal module for the CategoryTree extension. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Categorytree} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.categorytree(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Categorytree} method calls, like
  #
  # ```ruby
  # api.categorytree.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Categorytree} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Categorytree]
  #
  def categorytree(**options)
    Actions::Categorytree.new(**options)
  end
  # Fetch a centralauthtoken for making an authenticated request to an attached wiki. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Centralauthtoken} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.centralauthtoken(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Centralauthtoken} method calls, like
  #
  # ```ruby
  # api.centralauthtoken.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Centralauthtoken} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Centralauthtoken]
  #
  def centralauthtoken(**options)
    Actions::Centralauthtoken.new(**options)
  end
  # Get data needed to choose a banner for a given project and language 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Centralnoticechoicedata} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.centralnoticechoicedata(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Centralnoticechoicedata} method calls, like
  #
  # ```ruby
  # api.centralnoticechoicedata.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Centralnoticechoicedata} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Centralnoticechoicedata]
  #
  def centralnoticechoicedata(**options)
    Actions::Centralnoticechoicedata.new(**options)
  end
  # Get all configuration settings for a campaign. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Centralnoticequerycampaign} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.centralnoticequerycampaign(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Centralnoticequerycampaign} method calls, like
  #
  # ```ruby
  # api.centralnoticequerycampaign.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Centralnoticequerycampaign} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Centralnoticequerycampaign]
  #
  def centralnoticequerycampaign(**options)
    Actions::Centralnoticequerycampaign.new(**options)
  end
  # Change authentication data for the current user. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Changeauthenticationdata} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.changeauthenticationdata(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Changeauthenticationdata} method calls, like
  #
  # ```ruby
  # api.changeauthenticationdata.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Changeauthenticationdata} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Changeauthenticationdata]
  #
  def changeauthenticationdata(**options)
    Actions::Changeauthenticationdata.new(**options)
  end
  # Check the validity of a token from action=query&meta=tokens. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Checktoken} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.checktoken(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Checktoken} method calls, like
  #
  # ```ruby
  # api.checktoken.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Checktoken} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Checktoken]
  #
  def checktoken(**options)
    Actions::Checktoken.new(**options)
  end
  # Dump of CirrusSearch configuration. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::CirrusConfigDump} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.cirrus_config_dump(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::CirrusConfigDump} method calls, like
  #
  # ```ruby
  # api.cirrus_config_dump.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::CirrusConfigDump} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::CirrusConfigDump]
  #
  def cirrus_config_dump(**options)
    Actions::CirrusConfigDump.new(**options)
  end
  # Dump of CirrusSearch mapping for this wiki. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::CirrusMappingDump} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.cirrus_mapping_dump(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::CirrusMappingDump} method calls, like
  #
  # ```ruby
  # api.cirrus_mapping_dump.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::CirrusMappingDump} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::CirrusMappingDump]
  #
  def cirrus_mapping_dump(**options)
    Actions::CirrusMappingDump.new(**options)
  end
  # Dump of CirrusSearch settings for this wiki. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::CirrusSettingsDump} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.cirrus_settings_dump(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::CirrusSettingsDump} method calls, like
  #
  # ```ruby
  # api.cirrus_settings_dump.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::CirrusSettingsDump} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::CirrusSettingsDump]
  #
  def cirrus_settings_dump(**options)
    Actions::CirrusSettingsDump.new(**options)
  end
  # Clears the hasmsg flag for the current user. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Clearhasmsg} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.clearhasmsg(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Clearhasmsg} method calls, like
  #
  # ```ruby
  # api.clearhasmsg.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Clearhasmsg} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Clearhasmsg]
  #
  def clearhasmsg(**options)
    Actions::Clearhasmsg.new(**options)
  end
  # Log in to the wiki using the interactive flow. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Clientlogin} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.clientlogin(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Clientlogin} method calls, like
  #
  # ```ruby
  # api.clientlogin.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Clientlogin} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Clientlogin]
  #
  def clientlogin(**options)
    Actions::Clientlogin.new(**options)
  end
  # Get the difference between 2 pages. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Compare} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.compare(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Compare} method calls, like
  #
  # ```ruby
  # api.compare.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Compare} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Compare]
  #
  def compare(**options)
    Actions::Compare.new(**options)
  end
  # Create a new user account. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Createaccount} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.createaccount(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Createaccount} method calls, like
  #
  # ```ruby
  # api.createaccount.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Createaccount} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Createaccount]
  #
  def createaccount(**options)
    Actions::Createaccount.new(**options)
  end
  # Used by browsers to report violations of the Content Security Policy. This module should never be used, except when used automatically by a CSP compliant web browser. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Cspreport} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.cspreport(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Cspreport} method calls, like
  #
  # ```ruby
  # api.cspreport.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Cspreport} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Cspreport]
  #
  def cspreport(**options)
    Actions::Cspreport.new(**options)
  end
  # Delete a page. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Delete} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.delete(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Delete} method calls, like
  #
  # ```ruby
  # api.delete.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Delete} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Delete]
  #
  def delete(**options)
    Actions::Delete.new(**options)
  end
  # Delete Education Program objects. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Deleteeducation} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.deleteeducation(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Deleteeducation} method calls, like
  #
  # ```ruby
  # api.deleteeducation.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Deleteeducation} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Deleteeducation]
  #
  def deleteeducation(**options)
    Actions::Deleteeducation.new(**options)
  end
  # Delete a global user. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Deleteglobalaccount} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.deleteglobalaccount(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Deleteglobalaccount} method calls, like
  #
  # ```ruby
  # api.deleteglobalaccount.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Deleteglobalaccount} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Deleteglobalaccount]
  #
  def deleteglobalaccount(**options)
    Actions::Deleteglobalaccount.new(**options)
  end
  # Mark notifications as read for the current user. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Echomarkread} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.echomarkread(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Echomarkread} method calls, like
  #
  # ```ruby
  # api.echomarkread.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Echomarkread} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Echomarkread]
  #
  def echomarkread(**options)
    Actions::Echomarkread.new(**options)
  end
  # Mark notifications as seen for the current user. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Echomarkseen} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.echomarkseen(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Echomarkseen} method calls, like
  #
  # ```ruby
  # api.echomarkseen.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Echomarkseen} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Echomarkseen]
  #
  def echomarkseen(**options)
    Actions::Echomarkseen.new(**options)
  end
  # Create and edit pages. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Edit} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.edit(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Edit} method calls, like
  #
  # ```ruby
  # api.edit.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Edit} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Edit]
  #
  def edit(**options)
    Actions::Edit.new(**options)
  end
  # Edit a mass message delivery list. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Editmassmessagelist} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.editmassmessagelist(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Editmassmessagelist} method calls, like
  #
  # ```ruby
  # api.editmassmessagelist.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Editmassmessagelist} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Editmassmessagelist]
  #
  def editmassmessagelist(**options)
    Actions::Editmassmessagelist.new(**options)
  end
  # Email a user. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Emailuser} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.emailuser(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Emailuser} method calls, like
  #
  # ```ruby
  # api.emailuser.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Emailuser} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Emailuser]
  #
  def emailuser(**options)
    Actions::Emailuser.new(**options)
  end
  # Associate or disassociate a user as instructor or volunteer for a course. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Enlist} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.enlist(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Enlist} method calls, like
  #
  # ```ruby
  # api.enlist.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Enlist} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Enlist]
  #
  def enlist(**options)
    Actions::Enlist.new(**options)
  end
  # Expands all templates within wikitext. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Expandtemplates} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.expandtemplates(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Expandtemplates} method calls, like
  #
  # ```ruby
  # api.expandtemplates.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Expandtemplates} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Expandtemplates]
  #
  def expandtemplates(**options)
    Actions::Expandtemplates.new(**options)
  end
  # Get a new FancyCaptcha. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Fancycaptchareload} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.fancycaptchareload(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Fancycaptchareload} method calls, like
  #
  # ```ruby
  # api.fancycaptchareload.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Fancycaptchareload} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Fancycaptchareload]
  #
  def fancycaptchareload(**options)
    Actions::Fancycaptchareload.new(**options)
  end
  # Returns a featured content feed. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Featuredfeed} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.featuredfeed(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Featuredfeed} method calls, like
  #
  # ```ruby
  # api.featuredfeed.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Featuredfeed} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Featuredfeed]
  #
  def featuredfeed(**options)
    Actions::Featuredfeed.new(**options)
  end
  # Returns a user contributions feed. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Feedcontributions} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.feedcontributions(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Feedcontributions} method calls, like
  #
  # ```ruby
  # api.feedcontributions.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Feedcontributions} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Feedcontributions]
  #
  def feedcontributions(**options)
    Actions::Feedcontributions.new(**options)
  end
  # Returns a recent changes feed. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Feedrecentchanges} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.feedrecentchanges(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Feedrecentchanges} method calls, like
  #
  # ```ruby
  # api.feedrecentchanges.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Feedrecentchanges} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Feedrecentchanges]
  #
  def feedrecentchanges(**options)
    Actions::Feedrecentchanges.new(**options)
  end
  # Returns a watchlist feed. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Feedwatchlist} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.feedwatchlist(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Feedwatchlist} method calls, like
  #
  # ```ruby
  # api.feedwatchlist.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Feedwatchlist} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Feedwatchlist]
  #
  def feedwatchlist(**options)
    Actions::Feedwatchlist.new(**options)
  end
  # Revert a file to an old version. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Filerevert} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.filerevert(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Filerevert} method calls, like
  #
  # ```ruby
  # api.filerevert.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Filerevert} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Filerevert]
  #
  def filerevert(**options)
    Actions::Filerevert.new(**options)
  end
  # Get basic information about review flag configuration for this site. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Flagconfig} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.flagconfig(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Flagconfig} method calls, like
  #
  # ```ruby
  # api.flagconfig.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Flagconfig} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Flagconfig]
  #
  def flagconfig(**options)
    Actions::Flagconfig.new(**options)
  end
  # Globally block or unblock a user. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Globalblock} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.globalblock(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Globalblock} method calls, like
  #
  # ```ruby
  # api.globalblock.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Globalblock} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Globalblock]
  #
  def globalblock(**options)
    Actions::Globalblock.new(**options)
  end
  # Add/remove a user to/from global groups. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Globaluserrights} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.globaluserrights(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Globaluserrights} method calls, like
  #
  # ```ruby
  # api.globaluserrights.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Globaluserrights} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Globaluserrights]
  #
  def globaluserrights(**options)
    Actions::Globaluserrights.new(**options)
  end
  # Access graph tag functionality. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Graph} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.graph(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Graph} method calls, like
  #
  # ```ruby
  # api.graph.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Graph} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Graph]
  #
  def graph(**options)
    Actions::Graph.new(**options)
  end
  # Display help for the specified modules. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Help} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.help(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Help} method calls, like
  #
  # ```ruby
  # api.help.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Help} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Help]
  #
  def help(**options)
    Actions::Help.new(**options)
  end
  # This module has been disabled. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Imagerotate} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.imagerotate(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Imagerotate} method calls, like
  #
  # ```ruby
  # api.imagerotate.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Imagerotate} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Imagerotate]
  #
  def imagerotate(**options)
    Actions::Imagerotate.new(**options)
  end
  # Import a page from another wiki, or from an XML file. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Import} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.import(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Import} method calls, like
  #
  # ```ruby
  # api.import.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Import} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Import]
  #
  def import(**options)
    Actions::Import.new(**options)
  end
  # Allows direct access to JsonConfig subsystem. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Jsonconfig} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.jsonconfig(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Jsonconfig} method calls, like
  #
  # ```ruby
  # api.jsonconfig.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Jsonconfig} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Jsonconfig]
  #
  def jsonconfig(**options)
    Actions::Jsonconfig.new(**options)
  end
  # Retrieve localized JSON data. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Jsondata} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.jsondata(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Jsondata} method calls, like
  #
  # ```ruby
  # api.jsondata.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Jsondata} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Jsondata]
  #
  def jsondata(**options)
    Actions::Jsondata.new(**options)
  end
  # Search for language names in any script. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Languagesearch} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.languagesearch(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Languagesearch} method calls, like
  #
  # ```ruby
  # api.languagesearch.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Languagesearch} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Languagesearch]
  #
  def languagesearch(**options)
    Actions::Languagesearch.new(**options)
  end
  # Link an account from a third-party provider to the current user. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Linkaccount} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.linkaccount(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Linkaccount} method calls, like
  #
  # ```ruby
  # api.linkaccount.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Linkaccount} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Linkaccount]
  #
  def linkaccount(**options)
    Actions::Linkaccount.new(**options)
  end
  # Get the usernames and other information for students enrolled in one or more courses. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Liststudents} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.liststudents(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Liststudents} method calls, like
  #
  # ```ruby
  # api.liststudents.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Liststudents} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Liststudents]
  #
  def liststudents(**options)
    Actions::Liststudents.new(**options)
  end
  # Log in and get authentication cookies. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Login} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.login(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Login} method calls, like
  #
  # ```ruby
  # api.login.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Login} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Login]
  #
  def login(**options)
    Actions::Login.new(**options)
  end
  # Log out and clear session data. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Logout} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.logout(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Logout} method calls, like
  #
  # ```ruby
  # api.logout.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Logout} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Logout]
  #
  def logout(**options)
    Actions::Logout.new(**options)
  end
  # Perform management tasks relating to change tags. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Managetags} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.managetags(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Managetags} method calls, like
  #
  # ```ruby
  # api.managetags.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Managetags} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Managetags]
  #
  def managetags(**options)
    Actions::Managetags.new(**options)
  end
  # Send a message to a list of pages. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Massmessage} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.massmessage(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Massmessage} method calls, like
  #
  # ```ruby
  # api.massmessage.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Massmessage} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Massmessage]
  #
  def massmessage(**options)
    Actions::Massmessage.new(**options)
  end
  # Merge page histories. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Mergehistory} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.mergehistory(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Mergehistory} method calls, like
  #
  # ```ruby
  # api.mergehistory.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Mergehistory} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Mergehistory]
  #
  def mergehistory(**options)
    Actions::Mergehistory.new(**options)
  end
  # Returns data needed for mobile views. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Mobileview} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.mobileview(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Mobileview} method calls, like
  #
  # ```ruby
  # api.mobileview.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Mobileview} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Mobileview]
  #
  def mobileview(**options)
    Actions::Mobileview.new(**options)
  end
  # Move a page. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Move} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.move(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Move} method calls, like
  #
  # ```ruby
  # api.move.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Move} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Move]
  #
  def move(**options)
    Actions::Move.new(**options)
  end
  # Validate a two-factor authentication (OATH) token. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Oathvalidate} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.oathvalidate(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Oathvalidate} method calls, like
  #
  # ```ruby
  # api.oathvalidate.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Oathvalidate} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Oathvalidate]
  #
  def oathvalidate(**options)
    Actions::Oathvalidate.new(**options)
  end
  # Search the wiki using the OpenSearch protocol. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Opensearch} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.opensearch(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Opensearch} method calls, like
  #
  # ```ruby
  # api.opensearch.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Opensearch} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Opensearch]
  #
  def opensearch(**options)
    Actions::Opensearch.new(**options)
  end
  # Change preferences of the current user. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Options} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.options(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Options} method calls, like
  #
  # ```ruby
  # api.options.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Options} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Options]
  #
  def options(**options)
    Actions::Options.new(**options)
  end
  # Mark an article as reviewed or unreviewed. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Pagetriageaction} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.pagetriageaction(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Pagetriageaction} method calls, like
  #
  # ```ruby
  # api.pagetriageaction.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Pagetriageaction} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Pagetriageaction]
  #
  def pagetriageaction(**options)
    Actions::Pagetriageaction.new(**options)
  end
  # Get a list of page IDs for building a PageTriage queue. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Pagetriagelist} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.pagetriagelist(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Pagetriagelist} method calls, like
  #
  # ```ruby
  # api.pagetriagelist.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Pagetriagelist} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Pagetriagelist]
  #
  def pagetriagelist(**options)
    Actions::Pagetriagelist.new(**options)
  end
  # Get the stats for page triage. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Pagetriagestats} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.pagetriagestats(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Pagetriagestats} method calls, like
  #
  # ```ruby
  # api.pagetriagestats.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Pagetriagestats} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Pagetriagestats]
  #
  def pagetriagestats(**options)
    Actions::Pagetriagestats.new(**options)
  end
  # Add tags to an article. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Pagetriagetagging} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.pagetriagetagging(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Pagetriagetagging} method calls, like
  #
  # ```ruby
  # api.pagetriagetagging.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Pagetriagetagging} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Pagetriagetagging]
  #
  def pagetriagetagging(**options)
    Actions::Pagetriagetagging.new(**options)
  end
  # Fetch templates that are used within the PageTriage application. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Pagetriagetemplate} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.pagetriagetemplate(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Pagetriagetemplate} method calls, like
  #
  # ```ruby
  # api.pagetriagetemplate.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Pagetriagetemplate} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Pagetriagetemplate]
  #
  def pagetriagetemplate(**options)
    Actions::Pagetriagetemplate.new(**options)
  end
  # Obtain information about API modules. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Paraminfo} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.paraminfo(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Paraminfo} method calls, like
  #
  # ```ruby
  # api.paraminfo.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Paraminfo} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Paraminfo]
  #
  def paraminfo(**options)
    Actions::Paraminfo.new(**options)
  end
  # Parses content and returns parser output. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Parse} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.parse(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Parse} method calls, like
  #
  # ```ruby
  # api.parse.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Parse} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Parse]
  #
  def parse(**options)
    Actions::Parse.new(**options)
  end
  # 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::ParsoidBatch} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.parsoid_batch(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::ParsoidBatch} method calls, like
  #
  # ```ruby
  # api.parsoid_batch.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::ParsoidBatch} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::ParsoidBatch]
  #
  def parsoid_batch(**options)
    Actions::ParsoidBatch.new(**options)
  end
  # Patrol a page or revision. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Patrol} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.patrol(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Patrol} method calls, like
  #
  # ```ruby
  # api.patrol.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Patrol} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Patrol]
  #
  def patrol(**options)
    Actions::Patrol.new(**options)
  end
  # Change the protection level of a page. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Protect} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.protect(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Protect} method calls, like
  #
  # ```ruby
  # api.protect.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Protect} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Protect]
  #
  def protect(**options)
    Actions::Protect.new(**options)
  end
  # Purge the cache for the given titles. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Purge} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.purge(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Purge} method calls, like
  #
  # ```ruby
  # api.purge.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Purge} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Purge]
  #
  def purge(**options)
    Actions::Purge.new(**options)
  end
  # Fetch data from and about MediaWiki. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Query} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.query(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Query} method calls, like
  #
  # ```ruby
  # api.query.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Query} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Query]
  #
  def query(**options)
    Actions::Query.new(**options)
  end
  # Rebuild summary data of Education Program objects. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Refresheducation} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.refresheducation(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Refresheducation} method calls, like
  #
  # ```ruby
  # api.refresheducation.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Refresheducation} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Refresheducation]
  #
  def refresheducation(**options)
    Actions::Refresheducation.new(**options)
  end
  # Remove authentication data for the current user. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Removeauthenticationdata} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.removeauthenticationdata(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Removeauthenticationdata} method calls, like
  #
  # ```ruby
  # api.removeauthenticationdata.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Removeauthenticationdata} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Removeauthenticationdata]
  #
  def removeauthenticationdata(**options)
    Actions::Removeauthenticationdata.new(**options)
  end
  # Send a password reset email to a user. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Resetpassword} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.resetpassword(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Resetpassword} method calls, like
  #
  # ```ruby
  # api.resetpassword.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Resetpassword} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Resetpassword]
  #
  def resetpassword(**options)
    Actions::Resetpassword.new(**options)
  end
  # Review a revision by approving or de-approving it. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Review} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.review(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Review} method calls, like
  #
  # ```ruby
  # api.review.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Review} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Review]
  #
  def review(**options)
    Actions::Review.new(**options)
  end
  # Advertise or de-advertise yourself as reviewing an unreviewed page or unreviewed changes. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Reviewactivity} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.reviewactivity(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Reviewactivity} method calls, like
  #
  # ```ruby
  # api.reviewactivity.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Reviewactivity} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Reviewactivity]
  #
  def reviewactivity(**options)
    Actions::Reviewactivity.new(**options)
  end
  # Delete and undelete revisions. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Revisiondelete} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.revisiondelete(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Revisiondelete} method calls, like
  #
  # ```ruby
  # api.revisiondelete.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Revisiondelete} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Revisiondelete]
  #
  def revisiondelete(**options)
    Actions::Revisiondelete.new(**options)
  end
  # Undo the last edit to the page. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Rollback} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.rollback(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Rollback} method calls, like
  #
  # ```ruby
  # api.rollback.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Rollback} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Rollback]
  #
  def rollback(**options)
    Actions::Rollback.new(**options)
  end
  # Export an RSD (Really Simple Discovery) schema. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Rsd} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.rsd(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Rsd} method calls, like
  #
  # ```ruby
  # api.rsd.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Rsd} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Rsd]
  #
  def rsd(**options)
    Actions::Rsd.new(**options)
  end
  # Performs data validation for Kartographer extension 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::SanitizeMapdata} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.sanitize_mapdata(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::SanitizeMapdata} method calls, like
  #
  # ```ruby
  # api.sanitize_mapdata.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::SanitizeMapdata} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::SanitizeMapdata]
  #
  def sanitize_mapdata(**options)
    Actions::SanitizeMapdata.new(**options)
  end
  # Internal module for servicing XHR requests from the Scribunto console. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::ScribuntoConsole} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.scribunto_console(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::ScribuntoConsole} method calls, like
  #
  # ```ruby
  # api.scribunto_console.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::ScribuntoConsole} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::ScribuntoConsole]
  #
  def scribunto_console(**options)
    Actions::ScribuntoConsole.new(**options)
  end
  # Set a global user's status. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Setglobalaccountstatus} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.setglobalaccountstatus(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Setglobalaccountstatus} method calls, like
  #
  # ```ruby
  # api.setglobalaccountstatus.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Setglobalaccountstatus} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Setglobalaccountstatus]
  #
  def setglobalaccountstatus(**options)
    Actions::Setglobalaccountstatus.new(**options)
  end
  # Update the notification timestamp for watched pages. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Setnotificationtimestamp} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.setnotificationtimestamp(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Setnotificationtimestamp} method calls, like
  #
  # ```ruby
  # api.setnotificationtimestamp.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Setnotificationtimestamp} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Setnotificationtimestamp]
  #
  def setnotificationtimestamp(**options)
    Actions::Setnotificationtimestamp.new(**options)
  end
  # Changing the language of a page is not allowed on this wiki. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Setpagelanguage} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.setpagelanguage(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Setpagelanguage} method calls, like
  #
  # ```ruby
  # api.setpagelanguage.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Setpagelanguage} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Setpagelanguage]
  #
  def setpagelanguage(**options)
    Actions::Setpagelanguage.new(**options)
  end
  # Shorten a long URL into a shorter one. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Shortenurl} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.shortenurl(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Shortenurl} method calls, like
  #
  # ```ruby
  # api.shortenurl.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Shortenurl} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Shortenurl]
  #
  def shortenurl(**options)
    Actions::Shortenurl.new(**options)
  end
  # Get Wikimedia sites list. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Sitematrix} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.sitematrix(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Sitematrix} method calls, like
  #
  # ```ruby
  # api.sitematrix.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Sitematrix} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Sitematrix]
  #
  def sitematrix(**options)
    Actions::Sitematrix.new(**options)
  end
  # Validate one or more URLs against the SpamBlacklist. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Spamblacklist} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.spamblacklist(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Spamblacklist} method calls, like
  #
  # ```ruby
  # api.spamblacklist.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Spamblacklist} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Spamblacklist]
  #
  def spamblacklist(**options)
    Actions::Spamblacklist.new(**options)
  end
  # Configure review-protection settings for a page. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Stabilize} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.stabilize(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Stabilize} method calls, like
  #
  # ```ruby
  # api.stabilize.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Stabilize} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Stabilize]
  #
  def stabilize(**options)
    Actions::Stabilize.new(**options)
  end
  # Prepare an edit in shared cache. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Stashedit} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.stashedit(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Stashedit} method calls, like
  #
  # ```ruby
  # api.stashedit.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Stashedit} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Stashedit]
  #
  def stashedit(**options)
    Actions::Stashedit.new(**options)
  end
  # Allows admins to strike or unstrike a vote. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Strikevote} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.strikevote(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Strikevote} method calls, like
  #
  # ```ruby
  # api.strikevote.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Strikevote} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Strikevote]
  #
  def strikevote(**options)
    Actions::Strikevote.new(**options)
  end
  # Add or remove change tags from individual revisions or log entries. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Tag} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.tag(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Tag} method calls, like
  #
  # ```ruby
  # api.tag.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Tag} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Tag]
  #
  def tag(**options)
    Actions::Tag.new(**options)
  end
  # Fetch data stored by the TemplateData extension. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Templatedata} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.templatedata(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Templatedata} method calls, like
  #
  # ```ruby
  # api.templatedata.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Templatedata} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Templatedata]
  #
  def templatedata(**options)
    Actions::Templatedata.new(**options)
  end
  # Send a thank-you notification to an editor. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Thank} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.thank(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Thank} method calls, like
  #
  # ```ruby
  # api.thank.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Thank} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Thank]
  #
  def thank(**options)
    Actions::Thank.new(**options)
  end
  # Validate an article title, filename, or username against the TitleBlacklist. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Titleblacklist} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.titleblacklist(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Titleblacklist} method calls, like
  #
  # ```ruby
  # api.titleblacklist.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Titleblacklist} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Titleblacklist]
  #
  def titleblacklist(**options)
    Actions::Titleblacklist.new(**options)
  end
  # Get tokens for data-modifying actions. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Tokens} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.tokens(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Tokens} method calls, like
  #
  # ```ruby
  # api.tokens.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Tokens} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Tokens]
  #
  def tokens(**options)
    Actions::Tokens.new(**options)
  end
  # Users with the 'transcode-reset' right can reset and re-run a transcode job. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Transcodereset} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.transcodereset(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Transcodereset} method calls, like
  #
  # ```ruby
  # api.transcodereset.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Transcodereset} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Transcodereset]
  #
  def transcodereset(**options)
    Actions::Transcodereset.new(**options)
  end
  # Get the localization of ULS in the given language. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Ulslocalization} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.ulslocalization(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Ulslocalization} method calls, like
  #
  # ```ruby
  # api.ulslocalization.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Ulslocalization} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Ulslocalization]
  #
  def ulslocalization(**options)
    Actions::Ulslocalization.new(**options)
  end
  # Unblock a user. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Unblock} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.unblock(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Unblock} method calls, like
  #
  # ```ruby
  # api.unblock.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Unblock} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Unblock]
  #
  def unblock(**options)
    Actions::Unblock.new(**options)
  end
  # Restore revisions of a deleted page. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Undelete} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.undelete(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Undelete} method calls, like
  #
  # ```ruby
  # api.undelete.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Undelete} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Undelete]
  #
  def undelete(**options)
    Actions::Undelete.new(**options)
  end
  # Remove a linked third-party account from the current user. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Unlinkaccount} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.unlinkaccount(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Unlinkaccount} method calls, like
  #
  # ```ruby
  # api.unlinkaccount.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Unlinkaccount} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Unlinkaccount]
  #
  def unlinkaccount(**options)
    Actions::Unlinkaccount.new(**options)
  end
  # Upload a file, or get the status of pending uploads. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Upload} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.upload(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Upload} method calls, like
  #
  # ```ruby
  # api.upload.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Upload} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Upload]
  #
  def upload(**options)
    Actions::Upload.new(**options)
  end
  # Change a user's group membership. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Userrights} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.userrights(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Userrights} method calls, like
  #
  # ```ruby
  # api.userrights.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Userrights} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Userrights]
  #
  def userrights(**options)
    Actions::Userrights.new(**options)
  end
  # Validate a password against the wiki's password policies. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Validatepassword} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.validatepassword(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Validatepassword} method calls, like
  #
  # ```ruby
  # api.validatepassword.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Validatepassword} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Validatepassword]
  #
  def validatepassword(**options)
    Actions::Validatepassword.new(**options)
  end
  # Returns HTML5 for a page from the Parsoid service. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Visualeditor} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.visualeditor(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Visualeditor} method calls, like
  #
  # ```ruby
  # api.visualeditor.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Visualeditor} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Visualeditor]
  #
  def visualeditor(**options)
    Actions::Visualeditor.new(**options)
  end
  # Save an HTML5 page to MediaWiki (converted to wikitext via the Parsoid service). 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Visualeditoredit} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.visualeditoredit(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Visualeditoredit} method calls, like
  #
  # ```ruby
  # api.visualeditoredit.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Visualeditoredit} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Visualeditoredit]
  #
  def visualeditoredit(**options)
    Actions::Visualeditoredit.new(**options)
  end
  # Add or remove pages from the current user's watchlist. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Watch} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.watch(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Watch} method calls, like
  #
  # ```ruby
  # api.watch.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Watch} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Watch]
  #
  def watch(**options)
    Actions::Watch.new(**options)
  end
  # Returns a webapp manifest. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::WebappManifest} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.webapp_manifest(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::WebappManifest} method calls, like
  #
  # ```ruby
  # api.webapp_manifest.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::WebappManifest} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::WebappManifest]
  #
  def webapp_manifest(**options)
    Actions::WebappManifest.new(**options)
  end
  # Give WikiLove to another user. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Wikilove} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.wikilove(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Wikilove} method calls, like
  #
  # ```ruby
  # api.wikilove.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Wikilove} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Wikilove]
  #
  def wikilove(**options)
    Actions::Wikilove.new(**options)
  end
  # Get configuration of the Zero extension. 
  #
  # This method creates an instance of {MediaWiktory::Wikipedia::Actions::Zeroconfig} action.
  #
  # Action parameters could be passed to this method, like
  #
  # ```ruby
  # api.zeroconfig(param: 'value')
  # ```
  # ...or by subsequent {MediaWiktory::Wikipedia::Actions::Zeroconfig} method calls, like
  #
  # ```ruby
  # api.zeroconfig.param('value')
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and
  # {MediaWiktory::Wikipedia::Actions::Zeroconfig} class for a list of parameters and usage.
  #
  # @param [Hash] options Action options
  # @return [MediaWiktory::Wikipedia::Actions::Zeroconfig]
  #
  def zeroconfig(**options)
    Actions::Zeroconfig.new(**options)
  end

end