`ifndef I2SVIRTUAL32BITSWRITEOPERATIONTXMASTERRXSLAVESEQ_INCLUDED_
`define I2SVIRTUAL32BITSWRITEOPERATIONTXMASTERRXSLAVESEQ_INCLUDED_

class I2sVirtual32bitWriteOperationTxMasterRxSlaveSeq extends I2sVirtualBaseSeq;
  `uvm_object_utils(I2sVirtual32bitWriteOperationTxMasterRxSlaveSeq)

  I2sTransmitterWrite32bitTransferSeq i2sTransmitterWrite32bitTransferSeq;
 
  extern function new(string name = "I2sVirtual32bitWriteOperationTxMasterRxSlaveSeq");
  extern task body();
endclass : I2sVirtual32bitWriteOperationTxMasterRxSlaveSeq

function I2sVirtual32bitWriteOperationTxMasterRxSlaveSeq::new(string name = "I2sVirtual32bitWriteOperationTxMasterRxSlaveSeq");
  super.new(name);
endfunction : new

task I2sVirtual32bitWriteOperationTxMasterRxSlaveSeq::body();
  
repeat(4)
 begin
 i2sTransmitterWrite32bitTransferSeq = I2sTransmitterWrite32bitTransferSeq::type_id::create("i2sTransmitterWrite32bitTransferSeq");
  `uvm_info(get_type_name(), $sformatf("Inside Body Seq start I2sVirtual32bitWriteOperationTxMasterRxSlaveSeq"), UVM_NONE); 

   if(!i2sTransmitterWrite32bitTransferSeq.randomize() with {txSclkSeq==1;
						   	   txWsSeq==1; 
                                                           txNumOfBitsTransferSeq==32;
                                                           txWordSelectPeriodSeq==64;
                                                           clockrateFrequencySeq==48000;
                                                            }) begin  

       `uvm_error(get_type_name(), "Randomization failed : Inside I2sTransmitterWrite32bitTransferSeq")
  end


`uvm_info(get_type_name(), "Attempting to start the virtual sequence", UVM_NONE);
i2sTransmitterWrite32bitTransferSeq.start(p_sequencer.i2sTransmitterSequencer);

 end
 endtask : body

`endif

