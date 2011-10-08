
let s:source = {
      \ 'name': 'csharp',
      \ 'kind' : 'ftplugin',
      \ 'filetypes': {'cs' : 1 },
      \ }

let s:keywords = [
      \{'word' : 'System'                     , 'menu' : '[cs]'},
      \{'word' : 'System.Activities'          , 'menu' : '[cs]'},
      \{'word' : 'System.AddIn'               , 'menu' : '[cs]'},
      \{'word' : 'System.CodeDom'             , 'menu' : '[cs]'},
      \{'word' : 'System.Collections'         , 'menu' : '[cs]'},
      \{'word' : 'System.ComponentModel'      , 'menu' : '[cs]'},
      \{'word' : 'System.Configuration'       , 'menu' : '[cs]'},
      \{'word' : 'System.Data'                , 'menu' : '[cs]'},
      \{'word' : 'System.Deployment'          , 'menu' : '[cs]'},
      \{'word' : 'System.Device.Location'     , 'menu' : '[cs]'},
      \{'word' : 'System.Diagnostics'         , 'menu' : '[cs]'},
      \{'word' : 'System.DirectoryServices'   , 'menu' : '[cs]'},
      \{'word' : 'System.Drawing'             , 'menu' : '[cs]'},
      \{'word' : 'System.Dynamic'             , 'menu' : '[cs]'},
      \{'word' : 'System.EnterpriseServices'  , 'menu' : '[cs]'},
      \{'word' : 'System.Globalization'       , 'menu' : '[cs]'},
      \{'word' : 'System.IdentityModel'       , 'menu' : '[cs]'},
      \{'word' : 'System.IO'                  , 'menu' : '[cs]'},
      \{'word' : 'System.Linq'                , 'menu' : '[cs]'},
      \{'word' : 'System.Management'          , 'menu' : '[cs]'},
      \{'word' : 'System.Media'               , 'menu' : '[cs]'},
      \{'word' : 'System.Messaging'           , 'menu' : '[cs]'},
      \{'word' : 'System.Net'                 , 'menu' : '[cs]'},
      \{'word' : 'System.Numerics'            , 'menu' : '[cs]'},
      \{'word' : 'System.Printing'            , 'menu' : '[cs]'},
      \{'word' : 'System.Reflection'          , 'menu' : '[cs]'},
      \{'word' : 'System.Resources'           , 'menu' : '[cs]'},
      \{'word' : 'System.Runtime'             , 'menu' : '[cs]'},
      \{'word' : 'System.Security'            , 'menu' : '[cs]'},
      \{'word' : 'System.ServiceModel'        , 'menu' : '[cs]'},
      \{'word' : 'System.ServiceProcess'      , 'menu' : '[cs]'},
      \{'word' : 'System.Speech'              , 'menu' : '[cs]'},
      \{'word' : 'System.Text'                , 'menu' : '[cs]'},
      \{'word' : 'System.Threading'           , 'menu' : '[cs]'},
      \{'word' : 'System.Timers'              , 'menu' : '[cs]'},
      \{'word' : 'System.Transactions'        , 'menu' : '[cs]'},
      \{'word' : 'System.Web'                 , 'menu' : '[cs]'},
      \{'word' : 'System.Windows'             , 'menu' : '[cs]'},
      \{'word' : 'System.Workflow'            , 'menu' : '[cs]'},
      \{'word' : 'System.Xaml'                , 'menu' : '[cs]'},
      \{'word' : 'System.Xml'                 , 'menu' : '[cs]'},
      \{'word' : 'Accessibility'              , 'menu' : '[cs]'},
      \{'word' : 'Microsoft.Aspnet.Snapin'    , 'menu' : '[cs]'},
      \{'word' : 'Microsoft.Build'            , 'menu' : '[cs]'},
      \{'word' : 'Microsoft.CSharp'           , 'menu' : '[cs]'},
      \{'word' : 'Microsoft.Data.Entity.Build.Tasks' , 'menu' : '[cs]'},
      \{'word' : 'Microsoft.JScript'          , 'menu' : '[cs]'},
      \{'word' : 'Microsoft.SqlServer.Server' , 'menu' : '[cs]'},
      \{'word' : 'Microsoft.VisualBasic'      , 'menu' : '[cs]'},
      \{'word' : 'Microsoft.VisualC'          , 'menu' : '[cs]'},
      \{'word' : 'Microsoft.Win32'            , 'menu' : '[cs]'},
      \{'word' : 'Microsoft.Windows.Themes'   , 'menu' : '[cs]'},
      \{'word' : 'UIAutomationClientsideProviders' , 'menu' : '[cs]'},
      \{'word' : 'XamlGeneratedNamespace '    , 'menu' : '[cs]'},
      \]

function! s:source.initialize()
endfunction

function! s:source.finalize()
endfunction

function! s:source.get_keyword_pos(cur_text)
  return matchend(a:cur_text, '^using\s\+')
endfunction

function! s:source.get_complete_words(cur_keyword_pos, cur_keyword_str)
  return neocomplcache#keyword_filter(copy(s:keywords) , a:cur_keyword_str)
endfunction

function! neocomplcache#sources#csharp#define()
  return s:source
endfunction

