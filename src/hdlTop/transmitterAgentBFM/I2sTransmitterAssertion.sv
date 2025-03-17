`ifndef I2STRANSMITTERASSERTIONS_INCLUDED_
`define I2STRANSMITTERASSERTIONS_INCLUDED_

//import I2sGlobalPkg::*;
parameter int DATA_WIDTH=8;

interface I2sTransmitterAssertions (input  clk,
                                    input  rst,
				    input sclk,
				    input ws,
			            input [DATA_WIDTH-1:0] sd);
 
   import uvm_pkg::*;
  `include "uvm_macros.svh";
 
 
  initial begin
    `uvm_info("I2sTransmitterAssertions","I2sTransmitterAssertions",UVM_LOW);
  end

   
  /*property SdZeroWhenReset();
   @(posedge clk) 
      rst |-> sd==0;
  endproperty
  SD_ZER0_WHEN_RESET :assert property(SdZeroWhenReset)
   $info("TX_SD_ZER0_WHEN_RESET: ASSERTED");
   else
   $error("TX_SD_ZER0_WHEN_RESET:NOT ASSERTED");*/
 
  /*property wsNotUnknown();
      @(negedge sclk) disable iff (rst)
         !($isunknown(ws));
  endproperty
 
 WS_NOT_UNKNOWN: assert property (wsNotUnknown)
  $info("WS_NOT_UNKNOWN: ASSERTED");
  else
    $error("WS_NOT_UNKNOWN : NOT ASSERTED");*/   

  /*property sdNotUnknown();
     @(posedge sclk) disable iff (rst)
          //$changed(ws)  |-> !($isunknown(sd));
	  $changed(ws)  |-> (sd==1 || sd==0);

  endproperty
 
 
  SD_NOT_UNKNOWN: assert property (sdNotUnknown)
  $info("TX_SD_NOT_UNKNOWN: ASSERTED");
  else
    $error("TX_SD_NOT_UNKNOWN : NOT ASSERTED");*/

  /*property wsAlignWithPosedgeSclk();
      @(posedge sclk)
          $changed(ws)
  endproperty

 
  WS_ALIGN_WITH_POSEDGE_SCLK :assert property(wsAlignWithPosedgeSclk)
    $info("WS_ALIGN_WITH_POSEDGE_SCLK :ASSERTED");
    else
    $error("WS_ALIGN_WITH_POSEDGE_SCLK :NOT ASSERTED"); */           //WORKING
 
    /*property wsAlignWithNegedgeSclk();
      @(negedge sclkInput)
          $changed(wsInput)
    endproperty
 
  WS_ALIGN_WITH_NEGEDGE_SCLK :assert property(wsAlignWithNegedgeSclk)
    $info("WS_ALIGN_WITH_NEGEDGE_SCLK :ASSERTED");
    else
    $error("WS_ALIGN_WITH_NEGEDGE_SCLK :NOT ASSERTED"); */   

/*  property msbOfSdAlignWithWsInLeftJustifiedCodecMode();
     @(negedge sclk) disable iff (rst)
        ($changed(ws)) |->  !($isunknown(sd[DATA_WIDTH-1]));
  endproperty
 
  MSB_OF_SD_ALIGN_WITH_WS_IN_LEFT_JUSTIFIED_MODE: assert property(msbOfSdAlignWithWsInLeftJustifiedCodecMode)
     $info("MSB_OF_SD_ALIGN_WITH_WS_IN_LEFT_JUSTIFIED_MODE: ASSERTED");
     else
     $error("MSB_OF_SD_ALIGN_WITH_WS_IN_LEFT_JUSTIFIED_MODE: NOT ASSERTED"); */
 
  /*property sclkSamplingRate48khzAnd8BitsDataTransaction(int clkPeriod,int numOfTransferBits);
       realtime currentTime;
       @(posedge sclk) disable iff (rst)
      ('1,currentTime=$realtime) |=> @(posedge sclk) (($realtime - currentTime) == (clkPeriod));
        // $display("Assertion---------------");
         endproperty
  SCLK_SAMPLING_RATE_48KHZ_8BITS_DATA_TRANSACTION: assert property (sclkSamplingRate48khzAnd8BitsDataTransaction(1562000,8))  
       //$display("real time=%t",$time);
      $info("SCLK_SAMPLING_RATE_48KHZ_8BITS_DATA_TRASACTION: ASSERTED");

      else begin
      $error("SCLK_SAMPLING_RATE_48KHZ_8BITS_DATA_TRASACTION: NOT ASSERTED");
       $display("real time=%t",$realtime);
      // $display("The value of:%0t",($realtime-currectTime));
      end*/

/*property sclkSamplingRate48khzAnd16BitsDataTransaction(int clkPeriod,int numOfTransferBits);
       realtime currentTime;
       @(posedge sclk) disable iff (rst)
('1,currentTime=$realtime) |=> @(posedge sclk) (($realtime - currentTime) == (clkPeriod));
  endproperty
  SCLK_SAMPLING_RATE_48KHZ_16BITS_DATA_TRASACTION: assert property (sclkSamplingRate48khz(651,16))  
      $info("SCLK_SAMPLING_RATE_48KHZ_16BITS_DATA_TRASACTION: ASSERTED");
      else
      $error("SCLK_SAMPLING_RATE_48KHZ_16BITS_DATA_TRASACTION: NOT ASSERTED");           
 
  property sclkSamplingRate48khzAnd24BitsDataTransaction(int clkPeriod,int numOfTransferBits);
       realtime currentTime;
       @(posedge sclk) disable iff (rst)
('1,currentTime=$realtime) |=> @(posedge sclk) (($realtime - currentTime) == (clkPeriod));
  endproperty
  SCLK_SAMPLING_RATE_48KHZ_24BITS_DATA_TRASACTION: assert property (sclkSamplingRate48khz(434,24))  
      $info("SCLK_SAMPLING_RATE_48KHZ_24BITS_DATA_TRASACTION: ASSERTED");
      else
      $error("SCLK_SAMPLING_RATE_48KHZ_24BITS_DATA_TRASACTION: NOT ASSERTED");
 
   property sclkSamplingRate48khzAnd32BitsDataTransaction(int clkPeriod,int numOfTransferBits);
       realtime currentTime;
       @(posedge sclk) disable iff (rst)
('1,currentTime=$realtime) |=> @(posedge sclk) (($realtime - currentTime) == (clkPeriod));
  endproperty
  SCLK_SAMPLING_RATE_48KHZ_32BITS_DATA_TRASACTION: assert property (sclkSamplingRate48khz(325,32))  
      $info("SCLK_SAMPLING_RATE_48KHZ_32BITS_DATA_TRASACTION: ASSERTED");
      else
      $error("SCLK_SAMPLING_RATE_48KHZ_32BITS_DATA_TRASACTION: NOT ASSERTED");  */

 
endinterface : I2sTransmitterAssertions
 
`endif

/*
`ifndef I2STRANSMITTERASSERTIONS_INCLUDED_
`define I2STRANSMITTERASSERTIONS_INCLUDED_

import I2sGlobalPkg::*;

interface I2sTransmitterAssertions (input  clk,
                                    input  rst,
				    input sclk,
				    input ws,
				    input [DATA_WIDTH-1:0] sd);
 
  import uvm_pkg::*;
  `include "uvm_macros.svh";
 
// import I2sTransmitterPkg::I2sTransmitterAgentConfig;
 
// I2sTransmitterAgentConfig i2sTransmitterAgentConfig;
 
  initial begin
    `uvm_info("I2sTransmitterAssertions","I2sTransmitterAssertions",UVM_LOW);
  end
 
 
  property wsNotUnknown();
      @(negedge sclk) disable iff (rst)
         $fell(sclk) |-> !($isunknown(ws));
  endproperty
 
WS_NOT_UNKNOWN: assert property (wsNotUnknown)
  $info("WS_NOT_UNKNOWN: ASSERTED");
  else
    $error("WS_NOT_UNKNOWN : NOT ASSERTED");
  sequence wsSeqCheckNegedge;
      @(negedge sclk)
         $fell(sclk) |-> $changed(ws);
   endsequence
  property sdNotUnknown();
      wsSeqCheckNegedge |-> !($isunknown(sd));
  endproperty
 
 
  SD_NOT_UNKNOWN: assert property (sdNotUnknown)
  $info("SD_NOT_UNKNOWN: ASSERTED");
  else
    $error("SD_NOT_UNKNOWN : NOT ASSERTED");
 
property SdZeroWhenReset();
   @(posedge clk) 
      rst |-> sd==0;
endproperty
SD_ZER0_WHEN_RESET :assert property(SdZeroWhenReset)
   $info("SD_ZER0_WHEN_RESET: ASSERTED");
   else
   $error("SD_ZER0_WHEN_RESET:NOT ASSERTED");
 
  sequence wsSeqCheckPosedge;
      @(posedge sclk)
         $rose(sclk) |-> $changed(ws);
   endsequence
 
  property wsAlignWithSclk();
     wsSeqCheckPosedge or wsSeqCheckNegedge;
  endproperty
 
  WS_ALIGN_WITH_SCLK :assert property(wsAlignWithSclk)
    $info("WS_ALIGN_WITH_SCLK :ASSERTED");
    else
    $error("WS_ALIGN_WITH_SCLK :NOT ASSERTED");
 
    
  property msbOfSdAlignWithWsInLeftJustifiedCodecMode();
     disable iff (rst)
        (wsSeqCheckPosedge or wsSeqCheckNegedge) |->  !($isunknown(sd[DATA_WIDTH-1]));
  endproperty
 
  MSB_OF_SD_ALIGN_WITH_WS_IN_LEFT_JUSTIFIED_MODE: assert property(msbOfSdAlignWithWsInLeftJustifiedCodecMode)
     $info("MSB_OF_SD_ALIGN_WITH_WS_IN_LEFT_JUSTIFIED_MODE: ASSERTED");
     else
     $error("MSB_OF_SD_ALIGN_WITH_WS_IN_LEFT_JUSTIFIED_MODE: NOT ASSERTED");
 
  property sclkSamplingRate48khzAnd8BitsDataTransaction(int clkPeriod,int numOfTransferBits);
       realtime currentTime;
       @(posedge sclk) disable iff (rst)
('1,currentTime=$realtime) |=> @(posedge sclk) (($realtime - currentTime) == (clkPeriod));
  endproperty
  SCLK_SAMPLING_RATE_48KHZ_8BITS_DATA_TRASACTION: assert property (sclkSamplingRate48khz(1302,8))  
      $info("SCLK_SAMPLING_RATE_48KHZ_8BITS_DATA_TRASACTION: ASSERTED");
      else
      $error("SCLK_SAMPLING_RATE_48KHZ_8BITS_DATA_TRASACTION: NOT ASSERTED");
 
property sclkSamplingRate48khzAnd16BitsDataTransaction(int clkPeriod,int numOfTransferBits);
       realtime currentTime;
       @(posedge sclk) disable iff (rst)
('1,currentTime=$realtime) |=> @(posedge sclk) (($realtime - currentTime) == (clkPeriod));
  endproperty
  SCLK_SAMPLING_RATE_48KHZ_16BITS_DATA_TRASACTION: assert property (sclkSamplingRate48khz(651,16))  
      $info("SCLK_SAMPLING_RATE_48KHZ_16BITS_DATA_TRASACTION: ASSERTED");
      else
      $error("SCLK_SAMPLING_RATE_48KHZ_16BITS_DATA_TRASACTION: NOT ASSERTED");           
 
  property sclkSamplingRate48khzAnd24BitsDataTransaction(int clkPeriod,int numOfTransferBits);
       realtime currentTime;
       @(posedge sclk) disable iff (rst)
('1,currentTime=$realtime) |=> @(posedge sclk) (($realtime - currentTime) == (clkPeriod));
  endproperty
  SCLK_SAMPLING_RATE_48KHZ_24BITS_DATA_TRASACTION: assert property (sclkSamplingRate48khz(434,24))  
      $info("SCLK_SAMPLING_RATE_48KHZ_24BITS_DATA_TRASACTION: ASSERTED");
      else
      $error("SCLK_SAMPLING_RATE_48KHZ_24BITS_DATA_TRASACTION: NOT ASSERTED");
 
   property sclkSamplingRate48khzAnd32BitsDataTransaction(int clkPeriod,int numOfTransferBits);
       realtime currentTime;
       @(posedge sclk) disable iff (rst)
('1,currentTime=$realtime) |=> @(posedge sclk) (($realtime - currentTime) == (clkPeriod));
  endproperty
  SCLK_SAMPLING_RATE_48KHZ_32BITS_DATA_TRASACTION: assert property (sclkSamplingRate48khz(325,32))  
      $info("SCLK_SAMPLING_RATE_48KHZ_32BITS_DATA_TRASACTION: ASSERTED");
      else
      $error("SCLK_SAMPLING_RATE_48KHZ_32BITS_DATA_TRASACTION: NOT ASSERTED");  
 
endinterface : I2sTransmitterAssertions
 
`endif  */
  
