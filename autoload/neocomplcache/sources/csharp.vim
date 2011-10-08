
let s:source = {
      \ 'name': 'csharp',
      \ 'kind' : 'ftplugin',
      \ 'filetypes': {'cs' : 1 },
      \ }

let s:keywords = [
      \'System',
      \'System.Activities',
      \'System.AddIn',
      \'System.CodeDom',
      \'System.Collections',
      \'System.ComponentModel',
      \'System.Configuration',
      \'System.Data',
      \'System.Deployment',
      \'System.Device.Location',
      \'System.Diagnostics',
      \'System.DirectoryServices',
      \'System.Drawing',
      \'System.Dynamic',
      \'System.EnterpriseServices',
      \'System.Globalization',
      \'System.IdentityModel',
      \'System.IO',
      \'System.Linq',
      \'System.Management',
      \'System.Media',
      \'System.Messaging',
      \'System.Net',
      \'System.Numerics',
      \'System.Printing',
      \'System.Reflection',
      \'System.Resources',
      \'System.Runtime',
      \'System.Security',
      \'System.ServiceModel',
      \'System.ServiceProcess',
      \'System.Speech',
      \'System.Text',
      \'System.Threading',
      \'System.Timers',
      \'System.Transactions',
      \'System.Web',
      \'System.Windows',
      \'System.Workflow',
      \'System.Xaml',
      \'System.Xml',
      \'Accessibility',
      \'Microsoft.Aspnet.Snapin',
      \'Microsoft.Build',
      \'Microsoft.CSharp',
      \'Microsoft.Data.Entity.Build.Tasks',
      \'Microsoft.JScript',
      \'Microsoft.SqlServer.Server',
      \'Microsoft.VisualBasic',
      \'Microsoft.VisualC',
      \'Microsoft.Win32',
      \'Microsoft.Windows.Themes',
      \'UIAutomationClientsideProviders',
      \'XamlGeneratedNamespace',
      \]

let s:candidates = []

function! s:source.initialize()
  echoerr "initialize"
  for v in s:keywords
    call add(s:candidates, {'word' : v , 'menu' : '[cs]'})
  endfor
endfunction

function! s:source.finalize()
endfunction

function! s:source.get_keyword_pos(cur_text)
  return matchend(a:cur_text, '^using\s\+')
endfunction

function! s:source.get_complete_words(cur_keyword_pos, cur_keyword_str)
  return neocomplcache#keyword_filter(copy(s:candidates) , a:cur_keyword_str)
endfunction

function! neocomplcache#sources#csharp#define()
  return s:source
endfunction

