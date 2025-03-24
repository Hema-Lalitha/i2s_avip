`ifndef I2SVIRTUAL32BITSWRITEOPERATIONRXMASTERTXSLAVEWITHRXWSP32BITXWSP64BITSEQ_INCLUDED_
`define I2SVIRTUAL32BITSWRITEOPERATIONRXMASTERTXSLAVEWITHRXWSP32BITXWSP64BITSEQ_INCLUDED_

class I2sVirtual32bitWriteOperationRxMasterTxSlaveWithRxWSP32bitTxWSP64bitSeq extends I2sVirtualBaseSeq;
  `uvm_object_utils(I2sVirtual32bitWriteOperationRxMasterTxSlaveWithRxWSP32bitTxWSP64bitSeq)

  I2sReceiverWrite32bitTransferWithRxWSP32bitTxWSP64bitSeq i2sReceiverWrite32bitTransferWithRxWSP32bitTxWSP64bitSeq;
  I2sTransmitterWrite32bitTransferWithRxWSP32bitTxWSP64bitSeq i2sTransmitterWrite32bitTransferWithRxWSP32bitTxWSP64bitSeq;  

  extern function new(string name = "I2sVirtual32bitWriteOperationRxMasterTxSlaveWithRxWSP32bitTxWSP64bitSeq");
  extern task body();
endclass : I2sVirtual32bitWriteOperationRxMasterTxSlaveWithRxWSP32bitTxWSP64bitSeq

function I2sVirtual32bitWriteOperationRxMasterTxSlaveWithRxWSP32bitTxWSP64bitSeq::new(string name = "I2sVirtual32bitWriteOperationRxMasterTxSlaveWithRxWSP32bitTxWSP64bitSeq");
  super.new(name);
endfunction : new

task I2sVirtual32bitWriteOperationRxMasterTxSlaveWithRxWSP32bitTxWSP64bitSeq::body();
 
 repeat(2) 
  begin

  i2sReceiverWrite32bitTransferWithRxWSP32bitTxWSP64bitSeq = I2sReceiverWrite32bitTransferWithRxWSP32bitTxWSP64bitSeq::type_id::create("i2sReceiverWrite32bitTransferWithRxWSP32bitTxWSP64bitSeq");
  i2sTransmitterWrite32bitTransferWithRxWSP32bitTxWSP64bitSeq = I2sTransmitterWrite32bitTransferWithRxWSP32bitTxWSP64bitSeq::type_id::create("i2sTransmitterWrite32bitTransferWithRxWSP32bitTxWSP64bitSeq");

  `uvm_info(get_type_name(), $sformatf("Inside task Body Seq Start: I2sVirtual32bitWriteOperationRxMasterTxSlaveWithRxWSP32bitTxWSP64bitSeq"), UVM_NONE);



   if(!i2sReceiverWrite32bitTransferWithRxWSP32bitTxWSP64bitSeq.randomize() with {rxWsSeq==1;
							                          }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside I2sReceiverWrite32bitTransferWithRxWSP32bitTxWSP64bitSeq")
  end

 if (!i2sTransmitterWrite32bitTransferWithRxWSP32bitTxWSP64bitSeq.randomize() with 
                                                             {txNumOfBitsTransferSeq == (p_sequencer.i2sTransmitterSequencer.i2sTransmitterAgentConfig.wordSelectPeriod/2); 
                                                             }) begin
    `uvm_error(get_type_name(), "Randomization failed: Inside I2sTransmitterWrite32bitTransferWithRxWSP32bitTxWSP64bitSeq")
  end

  fork
    begin
  `uvm_info(get_type_name(), "Starting Receiver Sequence", UVM_LOW);
      i2sReceiverWrite32bitTransferWithRxWSP32bitTxWSP64bitSeq.start(p_sequencer.i2sReceiverSequencer);
  end
    begin
        `uvm_info(get_type_name(), "Starting Transmitter Sequence", UVM_LOW);
      i2sTransmitterWrite32bitTransferWithRxWSP32bitTxWSP64bitSeq.start(p_sequencer.i2sTransmitterSequencer);
  end
  join

  `uvm_info(get_type_name(), "Fork_join Completed",UVM_NONE);
  end
endtask : body

`endif


