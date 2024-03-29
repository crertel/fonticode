defmodule FonticodeTest do
  use ExUnit.Case
  doctest Fonticode

  @normal """
  ABCDEFGHIJKLMNOPQRSTUVWXYZ
  abcdefghijklmnopqrstuvwxyz
  1234567890
  <>./\\?;:'"
  ~!@#$%^&*()_+
  """

  describe("substitute/2") do
    test "formats :noop" do
      assert Fonticode.format(@normal, :noop) == @normal
    end

    test "formats :sans_serif" do
      assert Fonticode.format(@normal, :sans_serif) == """
             𝖠𝖡𝖢𝖣𝖤𝖥𝖦𝖧𝖨𝖩𝖪𝖫𝖬𝖭𝖮𝖯𝖰𝖱𝖲𝖳𝖴𝖵𝖶𝖷𝖸𝖹
             𝖺𝖻𝖼𝖽𝖾𝖿𝗀𝗁𝗂𝗃𝗄𝗅𝗆𝗇𝗈𝗉𝗊𝗋𝗌𝗍𝗎𝗏𝗐𝗑𝗒𝗓
             𝟣𝟤𝟥𝟦𝟧𝟨𝟩𝟪𝟫𝟢
             <>./\\?;:'"
             ~!@#$%^&*()_+
             """
    end

    test "formats :cursive" do
      assert Fonticode.format(@normal, :cursive) == """
             𝒜ℬ𝒞𝒟ℰℱ𝒢ℋℐ𝒥𝒦ℒℳ𝒩𝒪𝒫𝒬ℛ𝒮𝒯𝒰𝒱𝒲𝒳𝒴𝒵
             𝒶𝒷𝒸𝒹ℯ𝒻ℊ𝒽𝒾𝒿𝓀𝓁𝓂𝓃ℴ𝓅𝓆𝓇𝓈𝓉𝓊𝓋𝓌𝓍𝓎𝓏
             1234567890
             <>./\\?;:'"
             ~!@#$%^&*()_+
             """
    end

    test "formats :gothic" do
      assert Fonticode.format(@normal, :gothic) == """
             𝔄𝔅ℭ𝔇𝔈𝔉𝔊ℌℑ𝔍𝔎𝔏𝔐𝔑𝔒𝔓𝔔ℜ𝔖𝔗𝔘𝔙𝔚𝔛𝔜ℨ
             𝔞𝔟𝔠𝔡𝔢𝔣𝔤𝔥𝔦𝔧𝔨𝔩𝔪𝔫𝔬𝔭𝔮𝔯𝔰𝔱𝔲𝔳𝔴𝔵𝔶𝔷
             1234567890
             <>./\\?;:'"
             ~!@#$%^&*()_+
             """
    end

    test "formats :bubble" do
      assert Fonticode.format(@normal, :bubble) == """
             ⒶⒷⒸⒹⒺⒻⒼⒽⒾⒿⓀⓁⓂⓃⓄⓅⓆⓇⓈⓉⓊⓋⓌⓍⓎⓏ
             ⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ
             ①②③④⑤⑥⑦⑧⑨⓪
             <>./\\?;:'"
             ~!@#$%^&*()_+
             """
    end

    test "formats :bubble_filled" do
      assert Fonticode.format(@normal, :bubble_filled) == """
             🅐🅑🅒🅓🅔🅕🅖🅗🅘🅙🅚🅛🅜🅝🅞🅟🅠🅡🅢🅣🅤🅥🅦🅧🅨🅩
             🅐🅑🅒🅓🅔🅕🅖🅗🅘🅙🅚🅛🅜🅝🅞🅟🅠🅡🅢🅣🅤🅥🅦🅧🅨🅩
             ➊➋➌➍➎➏➐➑➒⓿
             <>./\\?;:'"
             ~!@#$%^&*()_+
             """
    end

    test "formats :block" do
      assert Fonticode.format(@normal, :block) == """
             🄰🄱🄲🄳🄴🄵🄶🄷🄸🄹🄺🄻🄼🄽🄾🄿🅀🅁🅂🅃🅄🅅🅆🅇🅈🅉
             🄰🄱🄲🄳🄴🄵🄶🄷🄸🄹🄺🄻🄼🄽🄾🄿🅀🅁🅂🅃🅄🅅🅆🅇🅈🅉
             1234567890
             <>./\\?;:'"
             ~!@#$%^&*()_+
             """
    end

    test "formats :block_filled" do
      assert Fonticode.format(@normal, :block_filled) == """
             🅰🅱🅲🅳🅴🅵🅶🅷🅸🅹🅺🅻🅼🅽🅾🅿🆀🆁🆂🆃🆄🆅🆆🆇🆈🆉
             🅰🅱🅲🅳🅴🅵🅶🅷🅸🅹🅺🅻🅼🅽🅾🅿🆀🆁🆂🆃🆄🆅🆆🆇🆈🆉
             1234567890
             <>./\\?;:'"
             ~!@#$%^&*()_+
             """
    end

    test "formats :monospace" do
      assert Fonticode.format(@normal, :monospace) == """
             𝙰𝙱𝙲𝙳𝙴𝙵𝙶𝙷𝙸𝙹𝙺𝙻𝙼𝙽𝙾𝙿𝚀𝚁𝚂𝚃𝚄𝚅𝚆𝚇𝚈𝚉
             𝚊𝚋𝚌𝚍𝚎𝚏𝚐𝚑𝚒𝚓𝚔𝚕𝚖𝚗𝚘𝚙𝚚𝚛𝚜𝚝𝚞𝚟𝚠𝚡𝚢𝚣
             𝟷𝟸𝟹𝟺𝟻𝟼𝟽𝟾𝟿0
             <>./\\?;:'"
             ~!@#$%^&*()_+
             """
    end

    test "formats :blackboard_bold" do
      assert Fonticode.format(@normal, :blackboard_bold) == """
             𝔸𝔹ℂ𝔻𝔼𝔽𝔾ℍ𝕀𝕁𝕂𝕃𝕄ℕ𝕆ℙℚℝ𝕊𝕋𝕌𝕍𝕎𝕏𝕐ℤ
             𝕒𝕓𝕔𝕕𝕖𝕗𝕘𝕙𝕚𝕛𝕜𝕝𝕞𝕟𝕠𝕡𝕢𝕣𝕤𝕥𝕦𝕧𝕨𝕩𝕪𝕫
             𝟙𝟚𝟛𝟜𝟝𝟞𝟟𝟠𝟡𝟘
             <>./\\?;:'"
             ~!@#$%^&*()_+
             """
    end

    test "formats :small_caps" do
      assert Fonticode.format(@normal, :small_caps) == """
             ABCDEFGHIJKLMNOPQRSTUVWXYZ
             ᴀʙᴄᴅᴇғɢʜɪᴊᴋʟᴍɴᴏᴘǫʀsᴛᴜᴠᴡxʏᴢ
             1234567890
             <>./\\?;:'"
             ~!@#$%^&*()_+
             """
    end

    test "formats :aesthetic" do
      assert Fonticode.format(@normal, :aesthetic) == """
             ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ
             ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ
             １２３４５６７８９０
             ＜＞．／＼？；：＇＂
             ～！＠＃＄％＾＆＊（）＿＋
             """
    end

    test "formats :bold" do
      assert Fonticode.format(@normal, :bold) == """
             𝐀𝐁𝐂𝐃𝐄𝐅𝐆𝐇𝐈𝐉𝐊𝐋𝐌𝐍𝐎𝐏𝐐𝐑𝐒𝐓𝐔𝐕𝐖𝐗𝐘𝐙
             𝐚𝐛𝐜𝐝𝐞𝐟𝐠𝐡𝐢𝐣𝐤𝐥𝐦𝐧𝐨𝐩𝐪𝐫𝐬𝐭𝐮𝐯𝐰𝐱𝐲𝐳
             𝟏𝟐𝟑𝟒𝟓𝟔𝟕𝟖𝟗𝟎
             <>./\\?;:'"
             ~!@#$%^&*()_+
             """
    end

    test "formats :superscript" do
      assert Fonticode.format(@normal, :superscript) == """
             ᴬᴮꟲᴰᴱꟳᴳᴴᴵᴶᴷᴸᴹᴺᴼᴾꟴᴿˢᵀᵁⱽᵂˣʸᶻ
             ᵃᵇᶜᵈᵉᶠᵍʰᶦʲᵏˡᵐⁿᵒᵖ𐞥ʳˢᵗᵘᵛʷˣʸᶻ
             ¹²³⁴⁵⁶⁷⁸⁹⁰
             <>./\\?;:'"
             ~!@#$%^&*⁽⁾_⁺
             """
    end

    test "formats :italic" do
      assert Fonticode.format(@normal, :italic) == """
             𝐴𝐵𝐶𝐷𝐸𝐹𝐺𝐻𝐼𝐽𝐾𝐿𝑀𝑁𝑂𝑃𝑄𝑅𝑆𝑇𝑈𝑉𝑊𝑋𝑌𝑍
             𝑎𝑏𝑐𝑑𝑒𝑓𝑔ℎ𝑖𝑗𝑘𝑙𝑚𝑛𝑜𝑝𝑞𝑟𝑠𝑡𝑢𝑣𝑤𝑥𝑦𝑧
             1234567890
             <>./\\?;:'"
             ~!@#$%^&*()_+
             """
    end
  end
end
