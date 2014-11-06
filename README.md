rsInternationalSettings DSC Module
=======================

**rsInternationalSettings** is a PowerShell DSC resource module, which can be used to manage international system settings such as setting system locale, time zone user keyboard layout and culture (formatting) settings.

##Changelog##

######v0.0.1######
Added support for setting time zone, culture, system local and all local (inlucing default) user profile settings.

##Syntax##

<add syntax>

###Usage Examples###

<add examples>


###Acceptable parameter values###

*$Culture* - Default system codepage for non-Unicode applications. 
Use the following PowerShell command to list all available options:

    [cultureinfo]::GetCultures([System.Globalization.CultureTypes]::AllCultures)

*$TimeZone* - System time zone name description. Ex "GMT Standard Time"
Use the `tzutil /l` command to list all possible options.

*$LocationID* - Geographical System location ID (GEOID). Refer to [Table of Geographical Locations](http://msdn.microsoft.com/en-us/library/dd374073.asp) for full list of possible options.

*$LCIDHex* - Keyboard Language ID as defined by Microsoft. Used in combination with InputLocaleID, see [Keyboard Language & Locale IDs Assigned by Microsoft](http://msdn.microsoft.com/en-gb/goglobal/bb895996.aspx)

*$InputLocaleID* - Locale ID as defined by Microsoft. Used in combination with LCIDHex, see [Keyboard Language & Locale IDs Assigned by Microsoft](http://msdn.microsoft.com/en-gb/goglobal/bb895996.aspx)

**Keyboard options tip:** To easily identify correct settings for user keyboard options (*LCIDHex* & *InputLocaleID*), set the desired keyboard settings on a Windows 8/2012, or later, machine and run the following PS command `Get-WinUserLanguageList`. This will provide the keyboard settings for current user. Property named "InputMethodTips" will provide the correct Language Code ID as `{<LCIDHex>:<InputLocaleID>}`.

Example:

    PS C:\Users\Administrator> Get-WinUserLanguageList
    
    
    LanguageTag : en-US
    Autonym : English (United States)
    EnglishName : English
    LocalizedName   : English (United States)
    ScriptName  : Latin script
    InputMethodTips : {0409:00000409}
    Spellchecking   : True
    Handwriting : False

