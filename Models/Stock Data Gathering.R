require('quantmod')


stock_list <- c("MMM" , "AOS" , "ABT" , "ABBV" , "ABMD" , "ACN" , "ATVI" , "ADBE" , "AAP" , "AMD" , "AES" , "AFL" , "A" , "APD" , "AKAM" , "ALK" , "ALB" , "ARE" , "ALGN" , "ALLE" , "LNT" , "ALL" , "GOOGL" , "GOOG" , "MO" , "AMZN" , "AMCR" , "AEE" , "AAL" , "AEP" , "AXP" , "AIG" , "AMT" , "AWK" , "AMP" , "ABC" , "AME" , "AMGN" , "APH" , "ADI" , "ANSS" , "AON" , "APA" , "AIV" , "AAPL" , "AMAT" , "APTV" , "ADM" , "ANET" , "AJG" , "AIZ" , "T" , "ATO" , "ADSK" , "ADP" , "AZO" , "AVB" , "AVY" , "BKR" , "BAC" , "BAX" , "BDX" ,  "BBY" , "BIO" , "BIIB" , "BLK" , "BA" , "BKNG" , "BWA" , "BXP" , "BSX" , "BMY" , "AVGO" , "BR" ,  "CHRW"  , "CDNS" , "CPB" , "COF" , "CAH" , "KMX" , "CCL" , "CARR" , "CAT" , "CBOE" , "CBRE" , "CDW" , "CE" , "CNC" , "CNP"  , "CF" , "SCHW" , "CHTR" , "CVX" , "CMG" , "CB" , "CHD" , "CI" , "CINF" , "CTAS" , "CSCO" , "C" , "CFG" , "CTXS" , "CME" , "CMS" , "KO" , "CTSH" , "CL" , "CMCSA" , "CMA" , "CAG"  , "COP" , "ED" , "STZ" , "CPRT" , "GLW" , "CTVA" , "COST" , "COTY" , "CCI" , "CSX" , "CMI" , "CVS" , "DHI" , "DHR" , "DRI" , "DVA" , "DE" , "DAL" , "XRAY" , "DVN" , "DXCM" , "FANG" , "DLR" , "DFS"  , "DISH" , "DG" , "DLTR" , "D" , "DPZ" , "DOV" , "DOW" , "DTE" , "DUK" , "DRE" , "DD" , "DXC" , "EMN" , "ETN" , "EBAY" , "ECL" , "EIX" , "EW" , "EA" , "EMR" , "ETR" , "EOG" , "EFX" , "EQIX" , "EQR" , "ESS" , "EL" , "RE" , "EVRG" , "ES" , "EXC" , "EXPE" , "EXPD" , "EXR" , "XOM" , "FFIV" , "FAST" , "FRT" , "FDX" , "FIS" , "FITB" , "FRC" , "FE" , "FISV" , "FLT", "FLS" , "FMC" , "F" , "FTNT" , "FTV" , "FBHS" , "FOXA" , "FOX" , "BEN" , "FCX" , "GPS" , "GRMN" , "IT" , "GD" , "GE" , "GIS" , "GM" , "GPC" , "GILD" , "GPN" , "GL" , "GS" , "GWW" , "HRB" , "HAL" , "HBI" , "HIG" , "HAS" , "HCA" , "PEAK" , "HSIC" , "HES" , "HPE" , "HLT"  , "HOLX" , "HD" , "HON" , "HRL" , "HST" , "HWM" , "HPQ" , "HUM" , "HBAN" , "HII" , "IEX" , "IDXX" , "ITW" , "ILMN" , "INCY" , "IR" , "INTC" , "ICE" , "IBM" , "IFF" , "IP" , "IPG" , "INTU" , "ISRG" , "IVZ" , "IPGP" , "IQV" , "IRM" , "JBHT" , "JKHY" , "J" , "SJM" , "JNJ" , "JCI" , "JPM" , "JNPR" , "K" , "KEY" , "KEYS" , "KMB" , "KIM" , "KMI" , "KLAC" , "KSS" , "KHC" , "KR", "LHX" , "LH" , "LRCX" , "LW" , "LVS" , "LEG" , "LDOS" , "LEN" , "LLY" , "LNC" , "LIN" , "LYV" , "LKQ" , "LMT" , "L" , "LOW" , "LYB" , "MTB" , "MRO" , "MPC" , "MKTX" , "MAR" , "MMC" , "MLM" , "MAS" , "MA" , "MKC" , "MCD" , "MCK" , "MDT" , "MRK" , "MET" , "MTD" , "MGM" , "MCHP" , "MU" , "MSFT" , "MAA" , "MHK" , "TAP" , "MDLZ" , "MNST" , "MCO" , "MS" , "MSI" , "MSCI" , "NDAQ" , "NOV" , "NTAP" , "NFLX" , "NWL" , "NEM" , "NWSA" , "NWS" , "NEE" , "NLSN" , "NKE" , "NI" , "NSC" , "NTRS" , "NOC" , "NLOK" , "NCLH" , "NRG" , "NUE" , "NVDA" , "NVR" , "ORLY" , "OXY" , "ODFL" , "OMC" , "OKE" , "ORCL" , "OTIS" , "PCAR" , "PKG" , "PH" , "PAYX" , "PAYC" , "PYPL" , "PNR" , "PEP" , "PKI" , "PRGO" , "PFE" , "PM" , "PSX" , "PNW" , "PXD" , "PNC" , "PPG" , "PPL" , "PFG" , "PG" , "PGR" , "PLD" , "PRU" , "PEG" , "PSA" , "PHM" , "PVH" , "QRVO" , "QCOM" , "PWR" , "DGX" , "RL" , "RJF" , "RTX" , "O" , "REG" , "REGN" , "RF" , "RSG" , "RMD" , "RHI" , "ROK" , "ROL" , "ROP" , "ROST" , "RCL" , "SPGI" , "CRM" , "SBAC" , "SLB" , "STX" , "SEE" , "SRE" , "NOW" , "SHW" , "SPG" , "SWKS" , "SLG" , "SNA" , "SO" , "LUV" , "SWK" , "SBUX" , "STT" , "STE" , "SYK" , "SIVB" , "SYF" , "SNPS" , "SYY" , "TMUS" , "TROW" , "TTWO" , "TPR" , "TGT" , "TEL" , "FTI" , "TDY" , "TFX" , "TXN" , "TXT" , "BK" , "CLX" , "COO" , "HSY" , "MOS" , "TRV" , "DIS" , "TMO" , "TJX" , "TSCO" , "TT" , "TDG" , "TFC" , "TWTR" , "TYL" , "TSN" , "USB" , "UDR" , "ULTA" , "UAA" , "UA" , "UNP" , "UAL" , "UNH" , "UPS" , "URI" , "UHS" , "UNM" , "VLO" , "VTR" , "VRSN" , "VRSK" , "VZ" , "VRTX" , "VFC" , "V" , "VNO" , "VMC" , "WRB" , "WAB" , "WBA" , "WMT" , "WM" , "WAT" , "WEC" , "WFC" , "WELL" , "WST" , "WDC" , "WU" , "WRK" , "WY" , "WHR" , "WMB"  , "WYNN" , "XEL" , "XRX"  
                , "XYL" , "YUM" , "ZBRA" , "ZBH" , "ZION" , "ZTS")




start_date <- Sys.Date()-(365*20)

end_date <- Sys.Date()
master_df <- NULL
for (idx in seq(length(stock_list))){
  stock_index = stock_list[idx]
  getSymbols(stock_index, verbose = TRUE, src = "yahoo", 
             from=start_date,to=end_date)
  temp_df = as.data.frame(get(stock_index))
  temp_df$Date = row.names(temp_df)
  temp_df$Index = stock_index
  row.names(temp_df) = NULL
  colnames(temp_df) = c("Open", "High", "Low", "Close", 
                        "Volume", "Adjusted", "Date", "Index")
  temp_df = temp_df[c("Date", "Index", "Open", "High", 
                      "Low", "Close", "Volume", "Adjusted")]
  master_df = rbind(master_df, temp_df)
}


 t <- write.csv(master_df,"C:/Users/Tejas/git/Portfolio-Optimization-using-Machine-Learning/Models/stockprizes", row.names = TRUE)





