
{{- define "go-echo33fcb792-208f-47f4-88ff-c9f944e3f0ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo33fcb792-208f-47f4-88ff-c9f944e3f0ca.fullname" -}}
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


{{- define "go-echo33fcb792-208f-47f4-88ff-c9f944e3f0ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo33fcb792-208f-47f4-88ff-c9f944e3f0ca.labels" -}}
helm.sh/chart: {{ include "go-echo33fcb792-208f-47f4-88ff-c9f944e3f0ca.chart" . }}
{{ include "go-echo33fcb792-208f-47f4-88ff-c9f944e3f0ca.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo33fcb792-208f-47f4-88ff-c9f944e3f0ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo33fcb792-208f-47f4-88ff-c9f944e3f0ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}