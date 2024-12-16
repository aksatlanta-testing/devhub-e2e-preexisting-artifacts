
{{- define "go-echo6fada2a1-eaa6-4501-8492-52eafae997ad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6fada2a1-eaa6-4501-8492-52eafae997ad.fullname" -}}
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


{{- define "go-echo6fada2a1-eaa6-4501-8492-52eafae997ad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6fada2a1-eaa6-4501-8492-52eafae997ad.labels" -}}
helm.sh/chart: {{ include "go-echo6fada2a1-eaa6-4501-8492-52eafae997ad.chart" . }}
{{ include "go-echo6fada2a1-eaa6-4501-8492-52eafae997ad.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6fada2a1-eaa6-4501-8492-52eafae997ad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6fada2a1-eaa6-4501-8492-52eafae997ad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}