
{{- define "go-echo3a81d5cd-5546-41e8-9e1e-97512fe96859.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3a81d5cd-5546-41e8-9e1e-97512fe96859.fullname" -}}
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


{{- define "go-echo3a81d5cd-5546-41e8-9e1e-97512fe96859.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3a81d5cd-5546-41e8-9e1e-97512fe96859.labels" -}}
helm.sh/chart: {{ include "go-echo3a81d5cd-5546-41e8-9e1e-97512fe96859.chart" . }}
{{ include "go-echo3a81d5cd-5546-41e8-9e1e-97512fe96859.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3a81d5cd-5546-41e8-9e1e-97512fe96859.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3a81d5cd-5546-41e8-9e1e-97512fe96859.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}