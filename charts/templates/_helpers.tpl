
{{- define "go-echo3be3bc8b-1a5a-4147-ad44-0a008d624df3.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3be3bc8b-1a5a-4147-ad44-0a008d624df3.fullname" -}}
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


{{- define "go-echo3be3bc8b-1a5a-4147-ad44-0a008d624df3.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3be3bc8b-1a5a-4147-ad44-0a008d624df3.labels" -}}
helm.sh/chart: {{ include "go-echo3be3bc8b-1a5a-4147-ad44-0a008d624df3.chart" . }}
{{ include "go-echo3be3bc8b-1a5a-4147-ad44-0a008d624df3.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3be3bc8b-1a5a-4147-ad44-0a008d624df3.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3be3bc8b-1a5a-4147-ad44-0a008d624df3.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}