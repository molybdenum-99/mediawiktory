module MediaWiktory
  module ActionsMixin
    def abusefiltercheckmatch
      Abusefiltercheckmatch.new(self)
    end
    def abusefilterchecksyntax
      Abusefilterchecksyntax.new(self)
    end
    def abusefilterevalexpression
      Abusefilterevalexpression.new(self)
    end
    def abusefilterunblockautopromote
      Abusefilterunblockautopromote.new(self)
    end
    def addstudents
      Addstudents.new(self)
    end
    def antispoof
      Antispoof.new(self)
    end
    def block
      Block.new(self)
    end
    def bouncehandler
      Bouncehandler.new(self)
    end
    def centralauthtoken
      Centralauthtoken.new(self)
    end
    def centralnoticechoicedata
      Centralnoticechoicedata.new(self)
    end
    def centralnoticequerycampaign
      Centralnoticequerycampaign.new(self)
    end
    def checktoken
      Checktoken.new(self)
    end
    def cirrus_config_dump
      CirrusConfigDump.new(self)
    end
    def cirrus_mapping_dump
      CirrusMappingDump.new(self)
    end
    def cirrus_settings_dump
      CirrusSettingsDump.new(self)
    end
    def cirrus_suggest
      CirrusSuggest.new(self)
    end
    def clearhasmsg
      Clearhasmsg.new(self)
    end
    def compare
      Compare.new(self)
    end
    def createaccount
      Createaccount.new(self)
    end
    def cxconfiguration
      Cxconfiguration.new(self)
    end
    def cxdelete
      Cxdelete.new(self)
    end
    def cxpublish
      Cxpublish.new(self)
    end
    def cxtoken
      Cxtoken.new(self)
    end
    def delete
      Delete.new(self)
    end
    def deleteeducation
      Deleteeducation.new(self)
    end
    def deleteglobalaccount
      Deleteglobalaccount.new(self)
    end
    def echomarkread
      Echomarkread.new(self)
    end
    def echomarkseen
      Echomarkseen.new(self)
    end
    def edit
      Edit.new(self)
    end
    def editlist
      Editlist.new(self)
    end
    def editmassmessagelist
      Editmassmessagelist.new(self)
    end
    def emailuser
      Emailuser.new(self)
    end
    def enlist
      Enlist.new(self)
    end
    def expandtemplates
      Expandtemplates.new(self)
    end
    def fancycaptchareload
      Fancycaptchareload.new(self)
    end
    def featuredfeed
      Featuredfeed.new(self)
    end
    def feedcontributions
      Feedcontributions.new(self)
    end
    def feedrecentchanges
      Feedrecentchanges.new(self)
    end
    def feedwatchlist
      Feedwatchlist.new(self)
    end
    def filerevert
      Filerevert.new(self)
    end
    def flagconfig
      Flagconfig.new(self)
    end
    def flow
      Flow.new(self)
    end
    def flow_parsoid_utils
      FlowParsoidUtils.new(self)
    end
    def flowthank
      Flowthank.new(self)
    end
    def globalblock
      Globalblock.new(self)
    end
    def globaluserrights
      Globaluserrights.new(self)
    end
    def help
      Help.new(self)
    end
    def imagerotate
      Imagerotate.new(self)
    end
    def import
      Import.new(self)
    end
    def jsonconfig
      Jsonconfig.new(self)
    end
    def languagesearch
      Languagesearch.new(self)
    end
    def liststudents
      Liststudents.new(self)
    end
    def login
      Login.new(self)
    end
    def logout
      Logout.new(self)
    end
    def managetags
      Managetags.new(self)
    end
    def massmessage
      Massmessage.new(self)
    end
    def mobileview
      Mobileview.new(self)
    end
    def move
      Move.new(self)
    end
    def opensearch
      Opensearch.new(self)
    end
    def options
      Options.new(self)
    end
    def pagetriageaction
      Pagetriageaction.new(self)
    end
    def pagetriagelist
      Pagetriagelist.new(self)
    end
    def pagetriagestats
      Pagetriagestats.new(self)
    end
    def pagetriagetagging
      Pagetriagetagging.new(self)
    end
    def pagetriagetemplate
      Pagetriagetemplate.new(self)
    end
    def paraminfo
      Paraminfo.new(self)
    end
    def parse
      Parse.new(self)
    end
    def parsoid_batch
      ParsoidBatch.new(self)
    end
    def patrol
      Patrol.new(self)
    end
    def protect
      Protect.new(self)
    end
    def purge
      Purge.new(self)
    end
    def query
      Query.new(self)
    end
    def refresheducation
      Refresheducation.new(self)
    end
    def review
      Review.new(self)
    end
    def reviewactivity
      Reviewactivity.new(self)
    end
    def revisiondelete
      Revisiondelete.new(self)
    end
    def rollback
      Rollback.new(self)
    end
    def rsd
      Rsd.new(self)
    end
    def scribunto_console
      ScribuntoConsole.new(self)
    end
    def setglobalaccountstatus
      Setglobalaccountstatus.new(self)
    end
    def setnotificationtimestamp
      Setnotificationtimestamp.new(self)
    end
    def sitematrix
      Sitematrix.new(self)
    end
    def spamblacklist
      Spamblacklist.new(self)
    end
    def stabilize
      Stabilize.new(self)
    end
    def stashedit
      Stashedit.new(self)
    end
    def strikevote
      Strikevote.new(self)
    end
    def tag
      Tag.new(self)
    end
    def templatedata
      Templatedata.new(self)
    end
    def thank
      Thank.new(self)
    end
    def titleblacklist
      Titleblacklist.new(self)
    end
    def tokens
      Tokens.new(self)
    end
    def transcodereset
      Transcodereset.new(self)
    end
    def ulslocalization
      Ulslocalization.new(self)
    end
    def unblock
      Unblock.new(self)
    end
    def undelete
      Undelete.new(self)
    end
    def upload
      Upload.new(self)
    end
    def userdailycontribs
      Userdailycontribs.new(self)
    end
    def userrights
      Userrights.new(self)
    end
    def visualeditor
      Visualeditor.new(self)
    end
    def visualeditoredit
      Visualeditoredit.new(self)
    end
    def watch
      Watch.new(self)
    end
    def wikilove
      Wikilove.new(self)
    end
    def zeroconfig
      Zeroconfig.new(self)
    end
  end
end