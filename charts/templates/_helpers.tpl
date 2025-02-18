
{{- define "go-echo4a2b20fa-e7cd-4166-832b-19e4b862aaaa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4a2b20fa-e7cd-4166-832b-19e4b862aaaa.fullname" -}}
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


{{- define "go-echo4a2b20fa-e7cd-4166-832b-19e4b862aaaa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4a2b20fa-e7cd-4166-832b-19e4b862aaaa.labels" -}}
helm.sh/chart: {{ include "go-echo4a2b20fa-e7cd-4166-832b-19e4b862aaaa.chart" . }}
{{ include "go-echo4a2b20fa-e7cd-4166-832b-19e4b862aaaa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4a2b20fa-e7cd-4166-832b-19e4b862aaaa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4a2b20fa-e7cd-4166-832b-19e4b862aaaa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}