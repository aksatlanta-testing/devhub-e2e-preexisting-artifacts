
{{- define "go-echo80109eb9-2378-4145-aa32-fadbeed1b136.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo80109eb9-2378-4145-aa32-fadbeed1b136.fullname" -}}
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


{{- define "go-echo80109eb9-2378-4145-aa32-fadbeed1b136.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo80109eb9-2378-4145-aa32-fadbeed1b136.labels" -}}
helm.sh/chart: {{ include "go-echo80109eb9-2378-4145-aa32-fadbeed1b136.chart" . }}
{{ include "go-echo80109eb9-2378-4145-aa32-fadbeed1b136.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo80109eb9-2378-4145-aa32-fadbeed1b136.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo80109eb9-2378-4145-aa32-fadbeed1b136.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}