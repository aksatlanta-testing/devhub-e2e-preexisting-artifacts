
{{- define "go-echof2c1b901-30ef-4818-9bef-d4adc7be2f07.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2c1b901-30ef-4818-9bef-d4adc7be2f07.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echof2c1b901-30ef-4818-9bef-d4adc7be2f07.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2c1b901-30ef-4818-9bef-d4adc7be2f07.labels" -}}
helm.sh/chart: {{ include "go-echof2c1b901-30ef-4818-9bef-d4adc7be2f07.chart" . }}
{{ include "go-echof2c1b901-30ef-4818-9bef-d4adc7be2f07.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof2c1b901-30ef-4818-9bef-d4adc7be2f07.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof2c1b901-30ef-4818-9bef-d4adc7be2f07.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}