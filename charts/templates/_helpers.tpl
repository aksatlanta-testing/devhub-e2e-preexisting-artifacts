
{{- define "go-echof4cd57c6-d616-4999-a996-30dd722d08cd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof4cd57c6-d616-4999-a996-30dd722d08cd.fullname" -}}
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


{{- define "go-echof4cd57c6-d616-4999-a996-30dd722d08cd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof4cd57c6-d616-4999-a996-30dd722d08cd.labels" -}}
helm.sh/chart: {{ include "go-echof4cd57c6-d616-4999-a996-30dd722d08cd.chart" . }}
{{ include "go-echof4cd57c6-d616-4999-a996-30dd722d08cd.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof4cd57c6-d616-4999-a996-30dd722d08cd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof4cd57c6-d616-4999-a996-30dd722d08cd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}