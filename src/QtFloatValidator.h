#pragma once
#include <QDoubleValidator>

class QtFloatValidator : public QDoubleValidator
{
public:
    explicit QtFloatValidator(QObject * parent = nullptr);
	QtFloatValidator(std::string currentValue,double bottom, double top, int decimals, QObject* parent = nullptr);
	~QtFloatValidator();

	// virtual void fixup(QString & s) const;
	QValidator::State validate(QString &s, int &n) const;
private: 
    std::string m_currentValue;
};
