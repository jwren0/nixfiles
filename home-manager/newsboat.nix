pkgs: {
    enable = true;
    browser = "${pkgs.lynx}/bin/lynx";
    extraConfig = ''
    color listfocus         blue   default  bold
    color listfocus_unread  blue   default  bold
    color title             black  blue
    color info              black  blue
    color hint-key          black  blue
    '';
    urls = [
        {
            title = "Y Combinator News";
            url = "https://news.ycombinator.com/rss";
        }
    ];
}
