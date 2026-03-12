import os
class Config:
    @staticmethod
    def get_url():                              # static method
        if os.getenv("DATABASE_URI"):           #   returns None if not exists
            return os.getenv("DATABASE_URI")
        else:
            return "sqlite:///test.db"
    
    DATABASE_URI = get_url()                    #class-attribute

