
{{- define "go-echo75c0569d-1dca-4a14-9082-de2f461c224e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo75c0569d-1dca-4a14-9082-de2f461c224e.fullname" -}}
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


{{- define "go-echo75c0569d-1dca-4a14-9082-de2f461c224e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo75c0569d-1dca-4a14-9082-de2f461c224e.labels" -}}
helm.sh/chart: {{ include "go-echo75c0569d-1dca-4a14-9082-de2f461c224e.chart" . }}
{{ include "go-echo75c0569d-1dca-4a14-9082-de2f461c224e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo75c0569d-1dca-4a14-9082-de2f461c224e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo75c0569d-1dca-4a14-9082-de2f461c224e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}