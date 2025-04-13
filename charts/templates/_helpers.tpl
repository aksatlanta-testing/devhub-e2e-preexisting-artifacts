
{{- define "go-echo1afe1259-faf4-472a-9d71-50aa3866650f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1afe1259-faf4-472a-9d71-50aa3866650f.fullname" -}}
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


{{- define "go-echo1afe1259-faf4-472a-9d71-50aa3866650f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1afe1259-faf4-472a-9d71-50aa3866650f.labels" -}}
helm.sh/chart: {{ include "go-echo1afe1259-faf4-472a-9d71-50aa3866650f.chart" . }}
{{ include "go-echo1afe1259-faf4-472a-9d71-50aa3866650f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1afe1259-faf4-472a-9d71-50aa3866650f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1afe1259-faf4-472a-9d71-50aa3866650f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}