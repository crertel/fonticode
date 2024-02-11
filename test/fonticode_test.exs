defmodule FonticodeTest do
  use ExUnit.Case
  doctest Fonticode

  @normal """
  ABCDEFGHIJKLMNOPQRSTUVWXYZ
  abcdefghijklmnopqrstuvwxyz
  1234567890
  <>./\?;:'"
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
      <>./\?;:'"
      ~!@#$%^&*()_+
      """
    end
    test "formats :gothic" do
      assert Fonticode.format(@normal, :gothic) == """
      𝔄𝔅ℭ𝔇𝔈𝔉𝔊ℌℑ𝔍𝔎𝔏𝔐𝔑𝔒𝔓𝔔ℜ𝔖𝔗𝔘𝔙𝔚𝔛𝔜ℨ
      𝔞𝔟𝔠𝔡𝔢𝔣𝔤𝔥𝔦𝔧𝔨𝔩𝔪𝔫𝔬𝔭𝔮𝔯𝔰𝔱𝔲𝔳𝔴𝔵𝔶𝔷
      1234567890
      <>./\?;:'"
      ~!@#$%^&*()_+
      """
    end
    test "formats :bubble" do
      assert Fonticode.format(@normal, :bubble) == """
      ⒶⒷⒸⒹⒺⒻⒼⒽⒾⒿⓀⓁⓂⓃⓄⓅⓆⓇⓈⓉⓊⓋⓌⓍⓎⓏ
      ⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ
      ①②③④⑤⑥⑦⑧⑨⓪
      <>./\?;:'"
      ~!@#$%^&*()_+
      """
    end
    test "formats :bubble_filled" do
      assert Fonticode.format(@normal, :bubble_filled) == """
      🅐🅑🅒🅓🅔🅕🅖🅗🅘🅙🅚🅛🅜🅝🅞🅟🅠🅡🅢🅣🅤🅥🅦🅧🅨🅩
      🅐🅑🅒🅓🅔🅕🅖🅗🅘🅙🅚🅛🅜🅝🅞🅟🅠🅡🅢🅣🅤🅥🅦🅧🅨🅩
      ➊➋➌➍➎➏➐➑➒⓿
      <>./\?;:'"
      ~!@#$%^&*()_+
      """
    end
  end

end
