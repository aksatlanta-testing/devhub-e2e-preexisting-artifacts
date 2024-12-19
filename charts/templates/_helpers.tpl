
{{- define "go-echo86163aef-a435-4a67-a53e-73a3090aac6e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo86163aef-a435-4a67-a53e-73a3090aac6e.fullname" -}}
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


{{- define "go-echo86163aef-a435-4a67-a53e-73a3090aac6e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo86163aef-a435-4a67-a53e-73a3090aac6e.labels" -}}
helm.sh/chart: {{ include "go-echo86163aef-a435-4a67-a53e-73a3090aac6e.chart" . }}
{{ include "go-echo86163aef-a435-4a67-a53e-73a3090aac6e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo86163aef-a435-4a67-a53e-73a3090aac6e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo86163aef-a435-4a67-a53e-73a3090aac6e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}