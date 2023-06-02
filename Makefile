CXX = g++
CXXFLAGS = -std=c++11 -g

INCLUDES = -Iinclude
LIBS = -lpthread  -lfftw3

SRC_PATH = src
INC_PATH = include
OBJ_PATH = src/obj

INCS = $(wildcard $(INC_PATH)/*.h)
SRCS = $(wildcard $(SRC_PATH)/*.cc)
OBJS = $(SRCS:$(SRC_PATH)/%.cc=$(OBJ_PATH)/%.o)

all: image-processor-app

image-processor-app: $(OBJS)
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(OBJS) main.cc -o $@ $(LIBS)

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.cc $(INCS)
	$(call make-depend-cxx,$<,$@,$(subst .o,.d,$@))
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Generate dependencies
make-depend-cxx=$(CXX) -MM -MF $3 -MP -MT $2 $(CXXFLAGS) $(INCLUDES) $1
-include $(OBJFILES:.o=.d)

clean:
	rm -f src/obj/*.o src/obj/*.d image-processor-app
