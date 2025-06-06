`ifndef I2STRANSMITTERWRITE32BITTRANSFERWITHRXWSP48BITTXWSP64BITSEQ_INCLUDED_
`define I2STRANSMITTERWRITE32BITTRANSFERWITHRXWSP48BITTXWSP64BITSEQ_INCLUDED_

class I2sTransmitterWrite32bitTransferWithRxWSP48bitTxWSP64bitSeq extends I2sTransmitterBaseSeq;
  `uvm_object_utils(I2sTransmitterWrite32bitTransferWithRxWSP48bitTxWSP64bitSeq)

  rand logic txWsSeq;
  rand bit[DATA_WIDTH-1:0] txSdLeftChannelSeq[];
  rand bit[DATA_WIDTH-1:0] txSdRightChannelSeq[];
  rand numOfBitsTransferEnum txNumOfBitsTransferSeq;
  
  constraint txSdLeftChannelSeq_c{soft txSdLeftChannelSeq.size() == txNumOfBitsTransferSeq/DATA_WIDTH; }
  constraint txSdRightChannelSeq_c{soft txSdRightChannelSeq.size() == txNumOfBitsTransferSeq/DATA_WIDTH; }
    
  extern function new(string name = "I2sTransmitterWrite32bitTransferWithRxWSP48bitTxWSP64bitSeq");
  extern task body();
endclass : I2sTransmitterWrite32bitTransferWithRxWSP48bitTxWSP64bitSeq

function I2sTransmitterWrite32bitTransferWithRxWSP48bitTxWSP64bitSeq::new(string name = "I2sTransmitterWrite32bitTransferWithRxWSP48bitTxWSP64bitSeq");
  super.new(name);
endfunction : new

task I2sTransmitterWrite32bitTransferWithRxWSP48bitTxWSP64bitSeq::body();
  super.body();
    
  start_item(i2sTransmitterTransaction);
  if(!i2sTransmitterTransaction.randomize() with {
                            foreach(txSdLeftChannelSeq[i]){
                               txSdLeftChannel[i]  == txSdLeftChannelSeq[i]};
                            foreach(txSdRightChannelSeq[i]){
                               txSdRightChannel[i]  == txSdRightChannelSeq[i]};
                            txNumOfBitsTransfer  == txNumOfBitsTransferSeq;
                            }) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
 
  foreach(i2sTransmitterTransaction.txSdLeftChannel[i]) begin
    $display("Left Channel SD[%0d]=%b",i,i2sTransmitterTransaction.txSdLeftChannel[i]);
   end
  foreach(i2sTransmitterTransaction.txSdRightChannel[i]) begin
    $display("Right Channel SD[%0d]=%b",i,i2sTransmitterTransaction.txSdRightChannel[i]);
   end

  i2sTransmitterTransaction.print();
  finish_item(i2sTransmitterTransaction);

endtask:body
  
`endif



