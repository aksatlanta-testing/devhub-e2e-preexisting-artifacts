
{{- define "go-echo3e10ccef-d2fe-48a1-a330-753921c45a03.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e10ccef-d2fe-48a1-a330-753921c45a03.fullname" -}}
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


{{- define "go-echo3e10ccef-d2fe-48a1-a330-753921c45a03.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e10ccef-d2fe-48a1-a330-753921c45a03.labels" -}}
helm.sh/chart: {{ include "go-echo3e10ccef-d2fe-48a1-a330-753921c45a03.chart" . }}
{{ include "go-echo3e10ccef-d2fe-48a1-a330-753921c45a03.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3e10ccef-d2fe-48a1-a330-753921c45a03.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3e10ccef-d2fe-48a1-a330-753921c45a03.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}