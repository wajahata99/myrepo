class car:
    def __init__(self,price,engine):
        self.price=price
        self.engine=engine

    def car_type(self):
        if self.price > 10000 and self.engine < 1500:
            str = "likely a sedan"
        
        else:
            str = "likely a cross over"
            
    return print(str)
        